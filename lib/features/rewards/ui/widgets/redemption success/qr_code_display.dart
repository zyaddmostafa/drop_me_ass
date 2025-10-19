import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theme/app_colors.dart';

class QrCodeDisplay extends StatelessWidget {
  const QrCodeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey200, width: 1),
      ),
      child: SvgPicture.asset(
        'assets/svgs/QR_code.svg',
        width: 200.w,
        height: 200.w,
        fit: BoxFit.contain,
      ),
    );
  }
}
