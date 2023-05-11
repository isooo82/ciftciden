import 'package:ciftciden/data/models/user_model.dart';
import 'package:ciftciden/data/repositories/user_data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  late UserModel userData;

  UserCubit() : super(const UserInitial());

  Future<bool> loginUser(
      {required String userPhone, required String password}) async {
    userData = await fetchUserData(userPhone: userPhone, password: password);
    if (userData != null) {
      return true;
    } else {
      return false;
    }
  }

  registerUser() {}
}
