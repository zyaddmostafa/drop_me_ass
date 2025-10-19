import 'package:get_it/get_it.dart';
import '../../features/home/data/repo/rvm_repo.dart';
import '../../features/home/data/repo/user_repo.dart';
import '../../features/rewards/data/repo/rewards_repo.dart';
import '../../features/qr_scan/cubit/qr_scanner_cubit.dart';
import '../../features/home/ui/cubit/home_cubit.dart';
import '../../features/home/ui/cubit/user_data_cubit.dart';
import '../../features/rewards/ui/cubit/rewards_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Register Repositories
  getIt.registerLazySingleton<RvmRepo>(() => RvmRepo());
  getIt.registerLazySingleton<UserRepo>(() => UserRepo());
  getIt.registerLazySingleton<RewardsRepo>(() => RewardsRepo());

  // Register Cubits

  // UserDataCubit - SINGLETON (Global user data)
  // Provided globally in DropMeApp, shared across all features
  getIt.registerLazySingleton<UserDataCubit>(
    () => UserDataCubit(userRepo: getIt<UserRepo>()),
  );

  // HomeCubit - FACTORY (Nearby RVMs for home screen)
  getIt.registerFactory<HomeCubit>(() => HomeCubit(rvmRepo: getIt<RvmRepo>()));

  // QRScannerCubit - FACTORY (Route-scoped)
  getIt.registerFactory<QRScannerCubit>(
    () => QRScannerCubit(rvmRepo: getIt<RvmRepo>()),
  );

  // RewardsCubit - FACTORY (Route-scoped)
  getIt.registerFactory<RewardsCubit>(
    () => RewardsCubit(rewardsRepo: getIt<RewardsRepo>()),
  );
}
