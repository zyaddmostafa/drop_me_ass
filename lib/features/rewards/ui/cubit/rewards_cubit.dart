import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/data/models/user_model.dart';
import '../../data/models/reward_model.dart';
import '../../data/repo/rewards_repo.dart';
import 'rewards_state.dart';

class RewardsCubit extends Cubit<RewardsState> {
  final RewardsRepo rewardsRepo;

  RewardsCubit({required this.rewardsRepo}) : super(const RewardsInitial());

  Future<void> loadRewards(UserModel user) async {
    try {
      emit(const RewardsLoading());

      final rewards = await rewardsRepo.getAllRewards();

      emit(
        RewardsSuccess(
          allRewards: rewards,
          filteredRewards: rewards,
          selectedCategory: null,
          user: user,
        ),
      );
    } catch (e) {
      emit(RewardsError(message: 'Failed to load rewards: ${e.toString()}'));
    }
  }

  void filterByCategory(String? category) {
    final currentState = state;
    if (currentState is! RewardsSuccess) return;

    final filtered = category == null
        ? currentState.allRewards
        : currentState.allRewards.where((r) => r.category == category).toList();

    emit(
      RewardsSuccess(
        allRewards: currentState.allRewards,
        filteredRewards: filtered,
        selectedCategory: category,
        user: currentState.user,
      ),
    );
  }

  Future<void> redeemReward(RewardModel reward, UserModel user) async {
    // Validation
    if (!reward.isAffordable(user.points)) {
      emit(
        const RedemptionFailed(
          errorMessage: 'You don\'t have enough points for this reward',
        ),
      );

      return;
    }

    if (!reward.canRedeem) {
      emit(
        const RedemptionFailed(
          errorMessage: 'This reward is currently unavailable',
        ),
      );

      return;
    }

    try {
      emit(RedemptionProcessing(reward: reward));

      await Future.delayed(const Duration(milliseconds: 500));

      emit(
        RedemptionSuccess(
          redeemedReward: reward,
          updatedUser: user,
          pointsSpent: reward.pointCost,
          remainingPoints: user.points - reward.pointCost,
        ),
      );
    } catch (e) {
      emit(
        RedemptionFailed(errorMessage: 'Redemption failed: ${e.toString()}'),
      );
    }
  }
}
