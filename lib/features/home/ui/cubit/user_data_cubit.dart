import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/user_repo.dart';
import 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final UserRepo userRepo;

  UserDataCubit({required this.userRepo}) : super(const UserDataInitial());

  Future<void> loadUserData() async {
    try {
      emit(const UserDataLoading());
      final user = await userRepo.getCurrentUser();
      emit(UserDataSuccess(user: user));
    } catch (e) {
      emit(UserDataError(message: 'Failed to load user data: ${e.toString()}'));
    }
  }
}
