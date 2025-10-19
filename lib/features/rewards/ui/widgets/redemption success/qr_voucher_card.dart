import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../cubit/rewards_state.dart';
import 'voucher_title.dart';
import 'qr_code_display.dart';
import 'voucher_code_section.dart';
import 'voucher_expiry_info.dart';

class QrVoucherCard extends StatelessWidget {
  final RedemptionSuccess successState;

  const QrVoucherCard({super.key, required this.successState});

  @override
  Widget build(BuildContext context) {
    final reward = successState.redeemedReward;

    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const VoucherTitle(),

          const QrCodeDisplay(),
          verticalSpace(16),

          VoucherCodeSection(voucherCode: reward.id),
          verticalSpace(12),

          VoucherExpiryInfo(expiryDate: reward.expiryDate),
        ],
      ),
    );
  }
}
