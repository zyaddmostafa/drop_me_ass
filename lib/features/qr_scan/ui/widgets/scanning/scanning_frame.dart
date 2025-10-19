import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import 'corner_bracket.dart';
import 'animated_scanning_line.dart';

class ScanningFrame extends StatelessWidget {
  final Animation<double> scanAnimation;

  const ScanningFrame({super.key, required this.scanAnimation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      height: 250.h,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary, width: 3),
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),

          const CornerBracket(alignment: Alignment.topLeft),
          const CornerBracket(alignment: Alignment.topRight),
          const CornerBracket(alignment: Alignment.bottomLeft),
          const CornerBracket(alignment: Alignment.bottomRight),

          AnimatedScanningLine(animation: scanAnimation),
        ],
      ),
    );
  }
}
