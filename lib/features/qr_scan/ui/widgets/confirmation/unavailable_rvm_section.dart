import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/extention.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'action_button.dart';

class UnavailableRvmSection extends StatelessWidget {
  const UnavailableRvmSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.error.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.error.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: AppColors.error,
                size: 24.sp,
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RVM Unavailable',
                      style: AppTextStyles.font14MediumBlack.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                    verticalSpace(4),
                    Text(
                      'This machine is currently inactive. Please try another RVM.',
                      style: AppTextStyles.font12RegularGrey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        verticalSpace(16),
        ActionButton(
          text: 'Find Nearby RVMs',
          icon: Icons.map_outlined,
          onPressed: () => context.pushNamedAndRemoveUntil(
            Routes.home,
            predicate: (route) => false,
          ),
        ),
        verticalSpace(12),
        ActionButton(
          text: 'Scan Different RVM',
          icon: Icons.qr_code_scanner,
          isPrimary: false,
          onPressed: () => context.pushReplacementNamed(Routes.scanningScreen),
        ),
      ],
    );
  }
}
