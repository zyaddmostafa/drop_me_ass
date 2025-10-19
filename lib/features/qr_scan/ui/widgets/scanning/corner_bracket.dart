import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';

class CornerBracket extends StatelessWidget {
  final Alignment alignment;

  const CornerBracket({super.key, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: 30.w,
        height: 30.h,
        decoration: BoxDecoration(
          border: Border(
            top: alignment.y < 0
                ? const BorderSide(color: AppColors.primaryLight, width: 4)
                : BorderSide.none,
            bottom: alignment.y > 0
                ? const BorderSide(color: AppColors.primaryLight, width: 4)
                : BorderSide.none,
            left: alignment.x < 0
                ? const BorderSide(color: AppColors.primaryLight, width: 4)
                : BorderSide.none,
            right: alignment.x > 0
                ? const BorderSide(color: AppColors.primaryLight, width: 4)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
