import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../cubit/rewards_state.dart';
import 'summary_card_info_row.dart';

class RewardSummaryCard extends StatelessWidget {
  final RedemptionSuccess successState;

  const RewardSummaryCard({super.key, required this.successState});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary.withOpacity(0.2), width: 1),
      ),
      child: Column(
        children: [
          Text(
            successState.redeemedReward.name,
            style: AppTextStyles.font20SemiBoldBlack,
            textAlign: TextAlign.center,
          ),
          verticalSpace(20),

          SummaryCardInfoRow(
            label: 'Points Spent',
            value: '${successState.pointsSpent} pts',
            valueColor: AppColors.secondary,
          ),
          verticalSpace(12),

          SummaryCardInfoRow(
            label: 'Remaining Balance',
            value: '${successState.remainingPoints} pts',
            valueColor: AppColors.primary,
          ),
          verticalSpace(12),

          SummaryCardInfoRow(
            label: 'Your Tier',
            value:
                '${successState.updatedUser.tierEmoji} ${successState.updatedUser.tier}',
            valueColor: AppColors.textPrimary,
          ),
        ],
      ),
    );
  }
}
