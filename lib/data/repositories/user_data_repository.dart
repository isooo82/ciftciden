import 'package:ciftciden/data/models/ordered_items_model.dart';
import 'package:ciftciden/data/models/user_model.dart';

Future<UserModel> fetchUserData({required String userPhone, required String password}) async {
  return UserModel(userName: "userName",
      userSurname: "userSurname",
      email: "email",
      phoneNumber: "phoneNumber",
      isSeller: false,
      orderedItemsList: <OrderedItems>[]);
}