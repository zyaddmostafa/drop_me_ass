import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/reward_model.dart';
import '../shared/reward_image.dart';

class RewardCardImage extends StatelessWidget {
  final RewardModel reward;

  const RewardCardImage({super.key, required this.reward});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'reward_${reward.id}',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: SizedBox(
          width: 80.w,
          height: 80.w,
          child: RewardImage(reward: reward),
        ),
      ),
    );
  }
}
