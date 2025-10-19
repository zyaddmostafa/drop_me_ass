import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/reward_model.dart';
import '../../../../home/data/models/user_model.dart';
import '../rewards list/affordability_indicator.dart';

class PointsCostCard extends StatelessWidget {
  final RewardModel reward;
  final UserModel user;

  const PointsCostCard({super.key, required this.reward, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.secondary, AppColors.secondary.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Points Required',
                    style: AppTextStyles.font12MediumBlack.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  verticalSpace(4),
                  Row(
                    children: [
                      Text(
                        '${reward.pointCost}',
                        style: AppTextStyles.font32BoldBlack.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      horizontalSpace(4),
                      Text(
                        'pts',
                        style: AppTextStyles.font16MediumBlack.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.monetization_on,
                size: 48.sp,
                color: Colors.white.withOpacity(0.9),
              ),
            ],
          ),
          verticalSpace(12),
          AffordabilityIndicator(
            isAffordable: reward.isAffordable(user.points),
            pointsNeeded: reward.pointsNeeded(user.points),
          ),
        ],
      ),
    );
  }
}
