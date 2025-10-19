import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../cubit/rewards_cubit.dart';
import '../../cubit/rewards_state.dart';
import '../../../data/models/reward_model.dart';
import '../../../../home/data/models/user_model.dart';
import 'redemption_dialog.dart';

class RedemptionBottomBar extends StatelessWidget {
  final RewardModel reward;
  final UserModel user;

  const RedemptionBottomBar({
    super.key,
    required this.reward,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RewardsCubit, RewardsState>(
      builder: (builderContext, state) {
        final isLoading =
            state is RewardsLoading || state is RedemptionProcessing;
        final canAfford = reward.isAffordable(user.points);
        final canRedeem = reward.canRedeem && canAfford;

        return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            child: ElevatedButton(
              onPressed: canRedeem && !isLoading
                  ? () => RedemptionDialog.show(builderContext, reward, user)
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: canRedeem ? AppColors.primary : Colors.grey,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: isLoading
                  ? SizedBox(
                      height: 20.h,
                      width: 20.h,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      canRedeem
                          ? 'Redeem Now'
                          : !canAfford
                          ? 'Not Enough Points'
                          : 'Currently Unavailable',
                      style: AppTextStyles.font16BoldBlack.copyWith(
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
