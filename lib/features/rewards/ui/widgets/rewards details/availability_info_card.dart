import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/reward_model.dart';

class AvailabilityInfoCard extends StatelessWidget {
  final RewardModel reward;

  const AvailabilityInfoCard({super.key, required this.reward});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Availability', style: AppTextStyles.font16BoldBlack),
          verticalSpace(12),
          _InfoRow(
            icon: Icons.inventory_2_outlined,
            label: 'Stock Available',
            value: '${reward.stockRemaining} units',
            color: reward.stockRemaining > 10
                ? AppColors.success
                : AppColors.warning,
          ),
          if (reward.expiryDate != null) ...[
            verticalSpace(8),
            _InfoRow(
              icon: Icons.calendar_today,
              label: 'Valid Until',
              value: _formatDate(reward.expiryDate!),
              color: reward.isExpired
                  ? AppColors.error
                  : AppColors.textSecondary,
            ),
          ],
          verticalSpace(8),
          _InfoRow(
            icon: Icons.check_circle_outline,
            label: 'Status',
            value: reward.canRedeem ? 'Available' : 'Unavailable',
            color: reward.canRedeem ? AppColors.success : AppColors.error,
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18.sp, color: color),
        horizontalSpace(8),
        Text(
          '$label: ',
          style: AppTextStyles.font14MediumBlack.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.font14MediumBlack.copyWith(color: color),
        ),
      ],
    );
  }
}
