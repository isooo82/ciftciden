part of "user_cubit.dart";

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {
  const UserInitial() : super();
  @override
  List<Object> get props => [];
}
