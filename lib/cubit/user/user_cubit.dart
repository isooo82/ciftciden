import 'package:ciftciden/data/models/user_model.dart';
import 'package:ciftciden/data/repositories/user_data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  late UserModel userData;
  final UserDataRepository userDataRepository;

  UserCubit({required this.userDataRepository}) : super(const UserInitial());

  Future<bool> loginUser(
      {required String userPhone, required String password}) async {
    // userData = await fetchUserData(userPhone: userPhone, password: password);
    if (userData != null) {
      return true;
    } else {
      return false;
    }
  }

  registerUser({
    required String name,
    required String username,
    required String email,
    required String phone,
    required String password,
    required bool isSeller,
    required String address,
    required String passwordAgain,
  }) {
    userDataRepository.signUp(name: name,
        username: username,
        email: email,
        address: address,
        phone: phone,
        password: password,
        isSeller: isSeller,
        passwordAgain: passwordAgain);
  }
}
