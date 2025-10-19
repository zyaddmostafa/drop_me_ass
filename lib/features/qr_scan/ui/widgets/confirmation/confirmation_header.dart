import 'package:flutter/material.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ConfirmationHeader extends StatelessWidget {
  const ConfirmationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'QR Code Verified!',
          style: AppTextStyles.font24BoldBlack,
          textAlign: TextAlign.center,
        ),
        verticalSpace(8),
        Text(
          'RVM is ready to accept your bottles',
          style: AppTextStyles.font14RegularGrey,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
