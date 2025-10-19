import '../models/user_model.dart';

class UserRepo {
  UserModel? _currentUser;

  Future<void> _simulateDelay() async {
    await Future.delayed(const Duration(milliseconds: 200));
  }

  Future<UserModel> getCurrentUser() async {
    await _simulateDelay();
    _currentUser = UserModel.mockUser;

    return _currentUser!;
  }
}
