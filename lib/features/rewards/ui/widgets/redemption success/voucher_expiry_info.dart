import 'package:flutter/material.dart';
import '../../../../../core/theme/app_text_styles.dart';

class VoucherExpiryInfo extends StatelessWidget {
  final DateTime? expiryDate;

  const VoucherExpiryInfo({super.key, required this.expiryDate});

  @override
  Widget build(BuildContext context) {
    if (expiryDate == null) return const SizedBox.shrink();

    return Text(
      'Valid until: ${_formatDate(expiryDate!)}',
      style: AppTextStyles.font12RegularGrey,
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
