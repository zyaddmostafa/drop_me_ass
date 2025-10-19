import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_colors.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/di/get_it.dart';
import 'features/home/ui/cubit/user_data_cubit.dart';

class DropMeApp extends StatelessWidget {
  const DropMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        // Provide UserDataCubit globally - available to all features
        return BlocProvider(
          create: (context) => getIt<UserDataCubit>()..loadUserData(),
          child: MaterialApp(
            title: 'Drop Me',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: AppColors.primary,
              scaffoldBackgroundColor: AppColors.background,
              useMaterial3: true,
            ),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: Routes.mainNavigation,
          ),
        );
      },
    );
  }
}
