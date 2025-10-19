import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';

class AnimatedScanningLine extends StatelessWidget {
  final Animation<double> animation;

  const AnimatedScanningLine({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Positioned(
          top: (125.h) + (animation.value * 110.h),
          left: 10.w,
          right: 10.w,
          child: Container(
            height: 3,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.transparent,
                  AppColors.primary,
                  Colors.transparent,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.5),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
