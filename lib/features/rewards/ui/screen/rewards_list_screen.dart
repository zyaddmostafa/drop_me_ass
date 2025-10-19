import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../home/data/models/user_model.dart';
import '../../../home/ui/cubit/user_data_cubit.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/points_balance_card.dart';
import '../../../home/ui/cubit/user_data_state.dart';
import '../cubit/rewards_cubit.dart';
import '../cubit/rewards_state.dart';
import '../../data/models/reward_model.dart';
import '../widgets/rewards list/filter_chips_row.dart';
import '../widgets/rewards list/reward_list.dart';

class RewardsListScreen extends StatefulWidget {
  const RewardsListScreen({super.key});

  @override
  State<RewardsListScreen> createState() => _RewardsListScreenState();
}

class _RewardsListScreenState extends State<RewardsListScreen> {
  bool _hasLoadedRewards = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: 'Rewards', centerTitle: true),
      body: BlocBuilder<UserDataCubit, UserDataState>(
        builder: (context, userState) {
          if (userState is! UserDataSuccess) {
            // Show skeleton for user loading state
            return _buildUserDataSkeltonizer();
          }
          final user = userState.user;
          _loadRewards(context, user);

          return BlocBuilder<RewardsCubit, RewardsState>(
            builder: (context, rewardsState) {
              if (rewardsState is RewardsLoading ||
                  rewardsState is RewardsInitial) {
                return _buildRewardsSkeletonizer(user);
              }

              if (rewardsState is RewardsError) {
                return _rewardError(rewardsState, context, user);
              }

              if (rewardsState is RewardsSuccess) {
                return _rewardsSuccess(user, rewardsState, context);
              }

              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }

  Column _rewardsSuccess(
    UserModel user,
    RewardsSuccess rewardsState,
    BuildContext context,
  ) {
    return Column(
      children: [
        PointsBalanceCard(user: user),

        FilterChipsRow(
          selectedCategory: rewardsState.selectedCategory,
          onCategorySelected: (category) {
            context.read<RewardsCubit>().filterByCategory(category);
          },
        ),

        RewardList(reward: rewardsState.filteredRewards, user: user),
      ],
    );
  }

  void _loadRewards(BuildContext context, UserModel user) {
    if (!_hasLoadedRewards) {
      _hasLoadedRewards = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<RewardsCubit>().loadRewards(user);
      });
    }
  }

  Center _rewardError(
    RewardsError state,
    BuildContext context,
    UserModel user,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          verticalSpace(16),
          Text(state.message, textAlign: TextAlign.center),
          verticalSpace(16),
          ElevatedButton(
            onPressed: () {
              context.read<RewardsCubit>().loadRewards(user);
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardsSkeletonizer(UserModel user) {
    // Create mock data for skeleton
    final mockRewards = List.generate(
      6,
      (index) => RewardModel(
        id: 'SKELETON_$index',
        name: 'Loading Reward Name',
        description: 'Loading description text here',
        imageUrl: '',
        pointCost: 100,
        category: 'Vouchers',
        isAvailable: true,
        stockRemaining: 10,
        terms: 'Loading terms',
      ),
    );

    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          // Skeleton for points header
          PointsBalanceCard(user: user),

          // Skeleton for filter chips
          FilterChipsRow(selectedCategory: null, onCategorySelected: (_) {}),

          // Skeleton for rewards list
          RewardList(reward: mockRewards, user: user),
        ],
      ),
    );
  }

  Widget _buildUserDataSkeltonizer() {
    final mockUser = UserModel(
      id: 'skeleton',
      name: 'Loading User',
      points: 1250,
      redeemedRewards: [],
      lifetimePoints: 1250,
      totalRecycledBottles: 125,
    );

    return _buildRewardsSkeletonizer(mockUser);
  }
}
