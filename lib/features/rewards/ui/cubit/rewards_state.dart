import '../../../home/data/models/user_model.dart';
import '../../data/models/reward_model.dart';

abstract class RewardsState {
  const RewardsState();
}

class RewardsInitial extends RewardsState {
  const RewardsInitial();
}

class RewardsLoading extends RewardsState {
  const RewardsLoading();
}

class RewardsSuccess extends RewardsState {
  final List<RewardModel> allRewards;
  final List<RewardModel> filteredRewards;
  final String? selectedCategory;
  final UserModel user;

  const RewardsSuccess({
    required this.allRewards,
    required this.filteredRewards,
    required this.selectedCategory,
    required this.user,
  });
}

class RewardsError extends RewardsState {
  final String message;

  const RewardsError({required this.message});
}

class RedemptionProcessing extends RewardsState {
  final RewardModel reward;

  const RedemptionProcessing({required this.reward});
}

class RedemptionSuccess extends RewardsState {
  final RewardModel redeemedReward;
  final UserModel updatedUser;
  final int pointsSpent;
  final int remainingPoints;

  const RedemptionSuccess({
    required this.redeemedReward,
    required this.updatedUser,
    required this.pointsSpent,
    required this.remainingPoints,
  });
}

class RedemptionFailed extends RewardsState {
  final String errorMessage;

  const RedemptionFailed({required this.errorMessage});
}
