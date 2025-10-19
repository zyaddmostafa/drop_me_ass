import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ScanErrorDialog extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onRetry;

  const ScanErrorDialog({
    super.key,
    required this.onCancel,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Row(
        children: [
          Icon(Icons.error_outline, color: AppColors.error, size: 28.sp),
          horizontalSpace(12),
          Text('Invalid QR Code', style: AppTextStyles.font20SemiBoldBlack),
        ],
      ),
      content: Text(
        'The QR code could not be read. Please try again.',
        style: AppTextStyles.font14RegularGrey,
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text('Cancel', style: AppTextStyles.font14RegularGrey),
        ),
        ElevatedButton(
          onPressed: onRetry,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text('Try Again', style: AppTextStyles.font14MediumWhite),
        ),
      ],
    );
  }

  /// Show the error dialog
  static Future<void> show({
    required BuildContext context,
    required VoidCallback onCancel,
    required VoidCallback onRetry,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          ScanErrorDialog(onCancel: onCancel, onRetry: onRetry),
    );
  }
}
