import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../home/data/models/rvm_model.dart';

class RvmInfoCard extends StatelessWidget {
  final RvmModel rvm;

  const RvmInfoCard({super.key, required this.rvm});

  @override
  Widget build(BuildContext context) {
    final capacityPercentage = (rvm.currentBottles / rvm.bottleCapacity * 100)
        .toInt();

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.grey200, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // RVM ID
          Row(
            children: [
              Icon(Icons.qr_code_2, color: AppColors.primary, size: 24.sp),
              horizontalSpace(8),
              Text('RVM ${rvm.id}', style: AppTextStyles.font18BoldBlack),
              const Spacer(),
              _buildStatusBadge(),
            ],
          ),

          verticalSpace(16),

          // Location
          _buildInfoRow(
            icon: Icons.location_on_outlined,
            label: 'Location',
            value: rvm.location,
          ),

          verticalSpace(12),

          // Address
          _buildInfoRow(
            icon: Icons.map_outlined,
            label: 'Address',
            value: rvm.address,
          ),

          verticalSpace(12),

          // Capacity
          _buildCapacityRow(capacityPercentage),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: rvm.isActive
            ? AppColors.success.withOpacity(0.1)
            : AppColors.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: rvm.isActive ? AppColors.success : AppColors.error,
              shape: BoxShape.circle,
            ),
          ),
          horizontalSpace(6),
          Text(
            rvm.isActive ? 'Active' : 'Inactive',
            style: AppTextStyles.font12MediumBlack.copyWith(
              color: rvm.isActive ? AppColors.success : AppColors.error,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.grey500, size: 20.sp),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.font12RegularGrey),
              verticalSpace(2),
              Text(value, style: AppTextStyles.font14MediumBlack),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCapacityRow(int percentage) {
    Color capacityColor;
    if (percentage >= 80) {
      capacityColor = AppColors.error;
    } else if (percentage >= 50) {
      capacityColor = AppColors.warning;
    } else {
      capacityColor = AppColors.success;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.inventory_2_outlined, color: AppColors.grey500, size: 20.sp),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Capacity', style: AppTextStyles.font12RegularGrey),
              verticalSpace(6),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: LinearProgressIndicator(
                        value: percentage / 100,
                        backgroundColor: AppColors.grey200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          capacityColor,
                        ),
                        minHeight: 8.h,
                      ),
                    ),
                  ),
                  horizontalSpace(12),
                  Text(
                    '${rvm.currentBottles}/${rvm.bottleCapacity}',
                    style: AppTextStyles.font14MediumBlack.copyWith(
                      color: capacityColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
