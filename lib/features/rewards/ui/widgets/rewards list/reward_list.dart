import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/extention.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../home/data/models/user_model.dart';
import '../../../data/models/reward_model.dart';
import '../../cubit/rewards_cubit.dart';
import 'reward_card.dart';

class RewardList extends StatelessWidget {
  final List<RewardModel> reward;
  final UserModel user;
  const RewardList({super.key, required this.reward, required this.user});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: reward.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.card_giftcard_outlined,
                    size: 80.sp,
                    color: Colors.grey[400],
                  ),
                  verticalSpace(16),
                  Text(
                    'No rewards in this category',
                    style: AppTextStyles.font16RegularGrey,
                  ),
                  verticalSpace(8),
                  TextButton(
                    onPressed: () {
                      context.read<RewardsCubit>().filterByCategory(null);
                    },
                    child: const Text('View All Rewards'),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: reward.length,
              itemBuilder: (context, index) {
                final currentReward = reward[index];

                return RewardCard(
                  reward: currentReward,
                  userPoints: user.points,
                  onTap: () {
                    context.pushNamed(
                      Routes.rewardDetails,
                      arguments: {'reward': currentReward, 'user': user},
                    );
                  },
                );
              },
            ),
    );
  }
}
