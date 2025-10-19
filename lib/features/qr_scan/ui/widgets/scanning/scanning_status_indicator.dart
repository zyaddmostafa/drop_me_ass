import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ScanningStatusIndicator extends StatelessWidget {
  const ScanningStatusIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20.w,
              height: 20.h,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
            horizontalSpace(12),
            Text('Scanning...', style: AppTextStyles.font16MediumWhite),
          ],
        ),

        verticalSpace(16),
        Text(
          'Align QR code within the frame',
          style: AppTextStyles.font14RegularWhite.copyWith(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
