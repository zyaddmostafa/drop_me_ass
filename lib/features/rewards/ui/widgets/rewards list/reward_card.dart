import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/reward_model.dart';
import 'affordability_indicator.dart';
import 'reward_card_image.dart';

class RewardCard extends StatelessWidget {
  final RewardModel reward;
  final int userPoints;
  final VoidCallback onTap;

  const RewardCard({
    super.key,
    required this.reward,
    required this.userPoints,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isAffordable = reward.isAffordable(userPoints);
    final pointsNeeded = reward.pointsNeeded(userPoints);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            RewardCardImage(reward: reward),
            horizontalSpace(12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reward.name,
                    style: AppTextStyles.font16BoldBlack,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(4),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      reward.category,
                      style: AppTextStyles.font12MediumBlack.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  verticalSpace(8),

                  Row(
                    children: [
                      Text(
                        '💰 ${reward.pointCost} pts',
                        style: AppTextStyles.font14MediumBlack.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(4),

                  AffordabilityIndicator(
                    isAffordable: isAffordable,
                    pointsNeeded: pointsNeeded,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
