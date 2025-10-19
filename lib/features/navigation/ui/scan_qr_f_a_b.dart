import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/extention.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theme/app_colors.dart';

class ScanQrFAB extends StatelessWidget {
  const ScanQrFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(32),
      child: FloatingActionButton(
        onPressed: () {
          context.pushNamed(Routes.scanningScreen);
        },
        backgroundColor: AppColors.primary,
        child: Icon(
          Icons.qr_code_scanner_rounded,
          color: Colors.white,
          size: 36.sp,
        ),
      ),
    );
  }
}
