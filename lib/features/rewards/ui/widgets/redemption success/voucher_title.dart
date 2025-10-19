import 'package:flutter/material.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/helpers/spacing.dart';

class VoucherTitle extends StatelessWidget {
  const VoucherTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your Voucher',
          style: AppTextStyles.font18BoldBlack,
          textAlign: TextAlign.center,
        ),
        verticalSpace(8),
        Text(
          'Show this QR code at the counter',
          style: AppTextStyles.font14MediumBlack.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
