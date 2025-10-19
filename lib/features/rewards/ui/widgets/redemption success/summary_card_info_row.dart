import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class SummaryCardInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const SummaryCardInfoRow({
    super.key,
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.font14MediumBlack.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.font16BoldBlack.copyWith(color: valueColor),
        ),
      ],
    );
  }
}
