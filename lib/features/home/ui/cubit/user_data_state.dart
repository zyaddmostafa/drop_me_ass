import '../../data/models/user_model.dart';

abstract class UserDataState {
  const UserDataState();
}

final class UserDataInitial extends UserDataState {
  const UserDataInitial();
}

class UserDataLoading extends UserDataState {
  const UserDataLoading();
}

class UserDataSuccess extends UserDataState {
  final UserModel user;

  const UserDataSuccess({required this.user});
}

class UserDataError extends UserDataState {
  final String message;

  const UserDataError({required this.message});
}
