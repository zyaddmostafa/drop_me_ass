import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/qr_scan/ui/screen/scanning_screen.dart';
import '../../features/qr_scan/ui/screen/confirmation_screen.dart';
import '../../features/rewards/ui/screen/reward_details_screen.dart';
import '../../features/rewards/ui/screen/redemption_success_screen.dart';
import '../../features/rewards/data/models/reward_model.dart';
import '../../features/home/data/models/user_model.dart';
import '../../features/rewards/ui/cubit/rewards_cubit.dart';
import '../../features/rewards/ui/cubit/rewards_state.dart';
import '../../features/home/data/models/rvm_model.dart';
import '../../features/qr_scan/cubit/qr_scanner_cubit.dart';
import '../../features/navigation/ui/main_navigation.dart';
import '../di/get_it.dart';
import 'routes.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        // Main navigation with bottom bar (Home + Rewards tabs)
        return MaterialPageRoute(builder: (_) => const MainNavigation());

      case Routes.scanningScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<QRScannerCubit>(),
            child: const ScanningScreen(),
          ),
        );

      case Routes.confirmationScreen:
        final rvm = settings.arguments as RvmModel?;
        if (rvm == null) {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: Text('No RVM data provided')),
            ),
          );
        }
        return MaterialPageRoute(builder: (_) => ConfirmationScreen(rvm: rvm));

      case Routes.qrScanScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<QRScannerCubit>(),
            child: const ScanningScreen(),
          ),
        );

      case Routes.mainNavigation:
        return MaterialPageRoute(builder: (_) => const MainNavigation());

      case Routes.rewardDetails:
        final args = settings.arguments as Map<String, dynamic>?;
        final reward = args?['reward'] as RewardModel?;
        final user = args?['user'] as UserModel?;
        if (reward == null || user == null) {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: Text('No reward or user data provided')),
            ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RewardsCubit>(),
            child: RewardDetailsScreen(reward: reward, user: user),
          ),
        );

      case Routes.redemptionSuccess:
        final successState = settings.arguments as RedemptionSuccess?;
        if (successState == null) {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: Text('No redemption data provided')),
            ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => RedemptionSuccessScreen(successState: successState),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
