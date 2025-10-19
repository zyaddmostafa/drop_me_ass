import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extention.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../home/data/models/rvm_model.dart';
import '../widgets/confirmation/success_checkmark.dart';
import '../widgets/confirmation/rvm_info_card.dart';
import '../widgets/confirmation/deposit_info_box.dart';
import '../widgets/confirmation/confirmation_header.dart';
import '../widgets/confirmation/active_rvm_actions.dart';
import '../widgets/confirmation/unavailable_rvm_section.dart';

class ConfirmationScreen extends StatelessWidget {
  final RvmModel rvm;

  const ConfirmationScreen({super.key, required this.rvm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'Scan Confirmation',
        showBackButton: true,
        leadingIcon: Icons.close,
        leadingIconColor: AppColors.black,
        centerTitle: true,
        onBackPressed: () => context.pushNamedAndRemoveUntil(
          Routes.home,
          predicate: (route) => false,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              verticalSpace(20),

              const SuccessCheckmark(),

              verticalSpace(16),

              const ConfirmationHeader(),

              verticalSpace(32),

              RvmInfoCard(rvm: rvm),

              verticalSpace(20),

              const DepositInfoBox(),

              verticalSpace(32),

              if (rvm.isActive)
                ActiveRvmActions(
                  rvm: rvm,
                  onStartDeposit: () => _handleStartDeposit(context),
                )
              else
                const UnavailableRvmSection(),

              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }

  void _handleStartDeposit(BuildContext context) {
    // Show success toast/snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: AppColors.white,
              size: 20.sp,
            ),
            horizontalSpace(12),
            Expanded(
              child: Text(
                'Ready to deposit! Please insert your bottles.',
                style: AppTextStyles.font14MediumWhite,
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        duration: const Duration(seconds: 3),
      ),
    );

    // Navigate back to home after a short delay
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (context.mounted) {
        context.pushNamedAndRemoveUntil(
          Routes.home,
          predicate: (route) => false,
        );
      }
    });
  }
}
