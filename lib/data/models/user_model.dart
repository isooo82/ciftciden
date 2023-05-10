import 'ordered_items_model.dart';

class UserModel {
  final String userName;
  final String userSurname;
  final String email;
  final String phoneNumber;

  final bool isSeller;
  final List<OrderedItems> orderedItemsList;

  UserModel(
      {required this.userName,
      required this.userSurname,
      required this.email,
      required this.phoneNumber,
      required this.isSeller,
      required this.orderedItemsList});
}
