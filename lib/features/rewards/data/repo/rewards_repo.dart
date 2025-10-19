import '../models/reward_model.dart';

class RewardsRepo {
  Future<void> _simulateDelay() async {
    await Future.delayed(const Duration(milliseconds: 800));
  }

  Future<List<RewardModel>> getAllRewards() async {
    await _simulateDelay();

    return List.from(RewardModel.mockRewards);
  }

  Future<List<RewardModel>> getRewardsByCategory(String category) async {
    await _simulateDelay();

    return RewardModel.mockRewards
        .where((mockRewards) => mockRewards.category == category)
        .toList();
  }
}
