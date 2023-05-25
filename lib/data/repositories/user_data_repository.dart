import 'package:ciftciden/data/models/ordered_items_model.dart';
import 'package:ciftciden/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDataRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserModel?> getUser() async {
    User? user = _firebaseAuth.currentUser;

    if (user == null) {
      return null;
    } else if (user.isAnonymous) {
      return UserModel(
        userName: user.displayName!,
        userSurname: '',
        email: '',
        phoneNumber: '',
        isSeller: false,
        orderedItemsList: [],
      );
    }

    var userDoc =
        await _firebaseFirestore.collection('users').doc(user.uid).get();

    return UserModel(
      userName: userDoc['user_name'],
      userSurname: userDoc['user-surname'],
      email: userDoc['email'],
      phoneNumber: userDoc['phone'],
      isSeller: userDoc['is_seller'],
      orderedItemsList: [],
    );
  }

  signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'user-not-found':
        case 'wrong-password':
      }
    }
  }

  signInAnonymously(String username) async {
    await _firebaseAuth.signInAnonymously().then(
          (auth) => {
            auth.user!.updateDisplayName(username),
          },
        );
  }

  verifyUserExistsWithPhone({
    required String phone,
  }) async {
    print("Phone UserControl");
    Map<String, dynamic> userData = await _firebaseFirestore
        .collection('users')
        .where("phone", isEqualTo: phone)
        .get()
        .then((value) => value.docs.first.data())
        .catchError((e) {
      print(e.message);
      if (e.message == "No element") {
        return {"phone": null};
      }
    });
    print("TAKEN FROM THE DATABSE");
    print(userData);
    if(userData["phone"] == null){
      return false;
    }
    return true;
  }

  verifyAndSignUp(
      {required String name,
      required String username,
      required String email,
      required String address,
      required String phone,
      required String password,
      required bool isSeller,
      required String passwordAgain}) async {
    print("Phone Authentication");
    print("Phone Authentication");
    print("Phone Authentication");
    FirebaseAuth auth = FirebaseAuth.instance;

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }

        // Handle other errors
      },
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  signUpWithEmail({
    required String name,
    required String username,
    required String email,
    required String address,
    required String phone,
    required String password,
    required bool isSeller,
    required String passwordAgain,
  }) async {
    print("Email and Password Authentication");
    try {
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      userCredential.user!.sendEmailVerification();

      String userId = _firebaseAuth.currentUser!.uid;

      _firebaseFirestore.collection('users').doc(userId).set({
        'user_name': name,
        'user_surname': username,
        'is_seller': isSeller,
        'email': email,
        'address': address,
        'phone': phone,
        "created_at": FieldValue.serverTimestamp()
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'email-already-in-use':
          debugPrint("email already in use");
          break;
        default:
          debugPrint("other");
      }
    }
  }

  signOut() {
    _firebaseAuth.signOut();
  }

// updateTheProfile({required String userId}) async {
// // await _firebaseFirestore.collection('users').doc(userId).get().then(
// //       (snapshot) => {
// //         snapshot.reference.set(
// //           {
// //             'name': updatedHesapUser.name,
// //             'username': updatedHesapUser.username,
// //             'email': updatedHesapUser.email,
// //             'phone': updatedHesapUser.phone,
// //           },
// //           SetOptions(merge: true),
// //         ),
// //       },
// //     );
// return UserModel(
//     userName: "userName",
//     userSurname: "userSurname",
//     email: "email",
//     phoneNumber: "phoneNumber",
//     isSeller: false,
//     orderedItemsList: <OrderedItems>[]);

  // Getting the orders
  // Stream<QuerySnapshot<Map<String, dynamic>>> getTheUserOrders({
  //   required String userId,
  // }) {
  //   String query = "orders/";
  //   _firebaseFirestore.collection(query).where("user_id", isEqualTo: userId)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) => {
  //   querySnapshot.forEach((doc) => {
  //   console.log(doc.id, " => ", doc.data());
  //   // Do something with the order document here
  //   });
  //   }).catch((error) => {
  //   console.log("Error getting orders: ", error);
  //   });
  //
  //   return _firebaseFirestore.collection(query).snapshots
  //   (
  //   );
  // }

  // Adding
  Future<void> addOrder({
    required String userId,
    required String sellerId,
    required String situation,
    required String date,
    required List<String> orderedItems,
    required FieldValue createdAt,
  }) {
    // Call the user's CollectionReference to add a new user
    CollectionReference orders =
        FirebaseFirestore.instance.collection('orders');
    return orders
        .add({
          'user_id': userId,
          'seller_id': sellerId,
          'situation': situation,
          'date': date,
          'ordered_items': orderedItems,
          'created_at': createdAt,
          // John Doe
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  //  TODO: read Orders
  Future<void> readOrders({
    required String userId,
    required String sellerId,
    required String situation,
    required String date,
    required List<String> orderedItems,
    required FieldValue createdAt,
  }) {
    // Call the user's CollectionReference to add a new user
    CollectionReference orders =
        FirebaseFirestore.instance.collection('orders');
    return orders
        .add({
          'user_id': userId,
          'seller_id': sellerId,
          'situation': situation,
          'date': date,
          'ordered_items': orderedItems,
          'created_at': createdAt,
          // John Doe
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
