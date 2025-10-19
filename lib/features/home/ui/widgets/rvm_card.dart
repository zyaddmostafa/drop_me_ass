import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/rvm_model.dart';

class RvmCard extends StatelessWidget {
  final RvmModel rvm;
  final VoidCallback? onTap;

  const RvmCard({super.key, required this.rvm, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.background, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  rvm.isActive ? '🟢' : '🔴',
                  style: AppTextStyles.font16RegularBlack,
                ),

                horizontalSpace(8),

                Expanded(
                  child: Text(
                    '${rvm.id} - ${rvm.location}',
                    style: AppTextStyles.font16BoldBlack,
                  ),
                ),
              ],
            ),
            verticalSpace(8),

            Text(
              '250m away • ${_getFillPercentage()}% full',
              style: AppTextStyles.font14RegularGrey,
            ),
            verticalSpace(4),

            Text('+10 pts/bottle', style: AppTextStyles.font14MediumGreen),
          ],
        ),
      ),
    );
  }

  String _getFillPercentage() {
    final percentage = ((rvm.currentBottles / rvm.bottleCapacity) * 100)
        .toInt();

    return percentage.toString();
  }
}
