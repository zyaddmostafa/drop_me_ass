import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class DepositInfoBox extends StatelessWidget {
  const DepositInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.secondary.withOpacity(0.1),
            AppColors.secondary.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.secondary.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: AppColors.secondary, size: 20.sp),
              horizontalSpace(8),
              Text(
                'Deposit Information',
                style: AppTextStyles.font14MediumBlack.copyWith(
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
          verticalSpace(12),
          _buildInfoItem(label: 'Points per bottle:', value: '10 pts'),
          verticalSpace(8),
          _buildInfoItem(label: 'Estimated time:', value: '2-3 mins'),
          verticalSpace(8),
          _buildInfoItem(label: 'Available space:', value: 'Sufficient'),
        ],
      ),
    );
  }

  Widget _buildInfoItem({required String label, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.font12RegularGrey),
        Text(
          value,
          style: AppTextStyles.font14MediumBlack.copyWith(
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }
}
