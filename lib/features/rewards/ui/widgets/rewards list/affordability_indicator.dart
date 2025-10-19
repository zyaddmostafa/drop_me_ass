import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class AffordabilityIndicator extends StatelessWidget {
  final bool isAffordable;
  final int pointsNeeded;

  const AffordabilityIndicator({
    super.key,
    required this.isAffordable,
    required this.pointsNeeded,
  });

  @override
  Widget build(BuildContext context) {
    if (isAffordable) {
      return Row(
        children: [
          Icon(Icons.check_circle, color: AppColors.success, size: 16.sp),
          horizontalSpace(4),
          Text(
            'You can afford this! ✨',
            style: AppTextStyles.font12MediumBlack.copyWith(
              color: AppColors.success,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    } else if (pointsNeeded < 100) {
      return Row(
        children: [
          Icon(Icons.stars, color: AppColors.warning, size: 16.sp),
          horizontalSpace(4),
          Text(
            'Need $pointsNeeded more pts 🎯',
            style: AppTextStyles.font12MediumBlack.copyWith(
              color: AppColors.warning,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Icon(Icons.lock_outline, color: AppColors.textSecondary, size: 16.sp),
          horizontalSpace(4),
          Text(
            'Need $pointsNeeded more pts 🔒',
            style: AppTextStyles.font12RegularGrey.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      );
    }
  }
}
