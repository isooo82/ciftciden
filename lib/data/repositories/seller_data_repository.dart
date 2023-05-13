import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SellerRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addProduct({
    required String productId,
    required String sellerId,
    required String productName,
    required String price,
    required String name,
    required FieldValue createdAt, // FieldValue.serverTimestamp()
  }) {
    // Call the user's CollectionReference to add a new user
    CollectionReference orders =
    FirebaseFirestore.instance.collection('products');
    return orders
        .add({
      'user_id': productId,
      'seller_id': sellerId,
      'product_name': productName,
      'price': price,
      'ordered_items': name,
      'created_at': createdAt,
      // John Doe
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}