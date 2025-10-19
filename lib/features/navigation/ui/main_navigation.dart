import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/di/get_it.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../home/ui/cubit/home_cubit.dart';
import '../../home/ui/screens/home_screen.dart';
import '../../rewards/ui/cubit/rewards_cubit.dart';
import '../../rewards/ui/screen/rewards_list_screen.dart';
import 'nav_item.dart';
import 'scan_qr_f_a_b.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  late final HomeCubit _homeCubit;
  late final RewardsCubit _rewardsCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = getIt<HomeCubit>()..loadNearbyRVMs();
    _rewardsCubit = getIt<RewardsCubit>();
  }

  @override
  void dispose() {
    _homeCubit.close();
    _rewardsCubit.close();
    super.dispose();
  }

  List<Widget> get _screens => [
    BlocProvider.value(value: _homeCubit, child: const HomeScreen()),
    BlocProvider.value(value: _rewardsCubit, child: const RewardsListScreen()),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      floatingActionButton: const ScanQrFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: AppColors.white,
        elevation: 16,
        shadowColor: AppColors.black.withOpacity(0.15),
        height: 65.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavItem(
              icon: Icons.home_rounded,
              label: 'Home',
              isSelected: _currentIndex == 0,
              onTap: () => _onTabTapped(0),
            ),
            horizontalSpace(40), // Space for FAB
            NavItem(
              icon: Icons.card_giftcard_rounded,
              label: 'Rewards',
              isSelected: _currentIndex == 1,
              onTap: () => _onTabTapped(1),
            ),
          ],
        ),
      ),
    );
  }
}
