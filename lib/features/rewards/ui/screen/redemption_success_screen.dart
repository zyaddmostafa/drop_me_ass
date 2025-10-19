import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../cubit/rewards_state.dart';
import '../widgets/redemption success/email_reminder_box.dart';
import '../widgets/redemption success/qr_voucher_card.dart';
import '../widgets/redemption success/reward_summary_card.dart';
import '../widgets/redemption success/success_action_buttons.dart';
import '../widgets/redemption success/success_icon.dart';

class RedemptionSuccessScreen extends StatelessWidget {
  final RedemptionSuccess successState;

  const RedemptionSuccessScreen({super.key, required this.successState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Column(
            children: [
              verticalSpace(20),

              const SuccessIcon(),
              verticalSpace(32),

              Text(
                '🎉 Success!',
                style: AppTextStyles.font32BoldBlack,
                textAlign: TextAlign.center,
              ),
              verticalSpace(12),

              Text(
                'Your reward has been redeemed successfully!',
                style: AppTextStyles.font16RegularBlack.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpace(40),

              QrVoucherCard(successState: successState),
              verticalSpace(24),

              RewardSummaryCard(successState: successState),
              verticalSpace(24),

              const EmailReminderBox(),
              verticalSpace(40),

              const SuccessActionButtons(),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
