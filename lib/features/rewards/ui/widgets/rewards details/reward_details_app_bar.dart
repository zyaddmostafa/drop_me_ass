import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/extention.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../data/models/reward_model.dart';
import '../shared/reward_image.dart';

class RewardDetailsAppBar extends StatelessWidget {
  final RewardModel reward;

  const RewardDetailsAppBar({super.key, required this.reward});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 280.h,
      pinned: true,
      leading: IconButton(
        icon: Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
            size: 20.sp,
          ),
        ),
        onPressed: () => context.pop(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: 'reward_${reward.id}',
          child: RewardImage(reward: reward),
        ),
      ),
    );
  }
}
