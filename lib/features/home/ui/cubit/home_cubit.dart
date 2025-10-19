import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/rvm_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RvmRepo rvmRepo;

  HomeCubit({required this.rvmRepo}) : super(const HomeStateInitial());

  Future<void> loadNearbyRVMs() async {
    try {
      emit(const NearByRVMsLoading());
      final nearbyRVMs = await rvmRepo.getNearbyRVMs();
      emit(NearByRVMsSuccess(nearbyRVMs: nearbyRVMs));
    } catch (e) {
      emit(NearByRVMsError(message: 'Failed to load RVMs: ${e.toString()}'));
    }
  }
}
