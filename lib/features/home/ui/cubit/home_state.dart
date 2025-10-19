import '../../data/models/rvm_model.dart';

abstract class HomeState {
  const HomeState();
}

final class HomeStateInitial extends HomeState {
  const HomeStateInitial();
}

class NearByRVMsLoading extends HomeState {
  const NearByRVMsLoading();
}

class NearByRVMsSuccess extends HomeState {
  final List<RvmModel> nearbyRVMs;

  const NearByRVMsSuccess({required this.nearbyRVMs});
}

class NearByRVMsError extends HomeState {
  final String message;

  const NearByRVMsError({required this.message});
}
