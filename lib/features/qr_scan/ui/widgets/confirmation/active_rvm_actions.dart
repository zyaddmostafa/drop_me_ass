import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/extention.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../home/data/models/rvm_model.dart';
import 'action_button.dart';

class ActiveRvmActions extends StatelessWidget {
  final RvmModel rvm;
  final VoidCallback onStartDeposit;

  const ActiveRvmActions({
    super.key,
    required this.rvm,
    required this.onStartDeposit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActionButton(
          text: 'Start Deposit',
          icon: Icons.recycling_rounded,
          onPressed: onStartDeposit,
        ),
        verticalSpace(12),
        ActionButton(
          text: 'Scan Different RVM',
          icon: Icons.qr_code_scanner,
          isPrimary: false,
          onPressed: () => context.pushReplacementNamed(Routes.scanningScreen),
        ),
      ],
    );
  }
}
