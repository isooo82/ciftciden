import 'package:ciftciden/data/models/ordered_items_model.dart';
import 'package:ciftciden/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Future<UserModel> fetchUserData(
// {required String userPhone, required String password}) async
class UserDataRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserModel?> getHesapUser() async {
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

  signUp({
    required String name,
    required String username,
    required String email,
    required String address,
    required String phone,
    required String password,
    required bool isSeller,
    required String passwordAgain,
  }) async {
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
}
