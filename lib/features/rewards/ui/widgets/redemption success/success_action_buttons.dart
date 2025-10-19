import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/extention.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class SuccessActionButtons extends StatelessWidget {
  const SuccessActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 0,
            ),
            child: Text(
              'Browse More Rewards',
              style: AppTextStyles.font16BoldBlack.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
        verticalSpace(12),

        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              context.pushNamedAndRemoveUntil(
                Routes.mainNavigation,
                predicate: (route) => false,
              );
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              side: const BorderSide(color: AppColors.primary, width: 1.5),
            ),
            child: Text(
              'Back to Home',
              style: AppTextStyles.font16BoldBlack.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
