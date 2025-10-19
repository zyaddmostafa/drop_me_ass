import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/home/data/models/user_model.dart';
import '../../features/home/ui/widgets/tier_badge.dart';
import '../helpers/spacing.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class PointsBalanceCard extends StatelessWidget {
  final UserModel user;

  const PointsBalanceCard({super.key, required this.user});

  String _getTier(int points) {
    if (points >= 5000) return 'PLATINUM';
    if (points >= 2500) return 'GOLD';
    if (points >= 1000) return 'SILVER';

    return 'BRONZE';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.secondary, AppColors.secondary.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Hello, ${user.name}! 👋',
                  style: AppTextStyles.font16MediumWhite,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              horizontalSpace(8),
              TierBadge(tier: _getTier(user.points)),
            ],
          ),
          verticalSpace(16),
          Text('Available Points', style: AppTextStyles.font12RegularWhite70),
          verticalSpace(4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${user.points}',
                style: AppTextStyles.font32BoldGold.copyWith(
                  color: Colors.white,
                ),
              ),
              horizontalSpace(8),
              Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: Text('pts', style: AppTextStyles.font14RegularWhite),
              ),
            ],
          ),
          verticalSpace(12),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  icon: Icons.eco_rounded,
                  label: 'Bottles',
                  value: '${user.totalRecycledBottles}',
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: _buildStatItem(
                  icon: Icons.star_rounded,
                  label: 'Lifetime',
                  value: '${user.lifetimePoints}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 16.sp),
        horizontalSpace(6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: AppTextStyles.font14MediumWhite),
            Text(
              label,
              style: AppTextStyles.font10RegularGrey.copyWith(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
