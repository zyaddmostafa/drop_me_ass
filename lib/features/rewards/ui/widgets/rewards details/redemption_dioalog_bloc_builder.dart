import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/extention.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../home/ui/cubit/user_data_cubit.dart';
import '../../../../home/ui/cubit/user_data_state.dart';
import '../../../data/models/reward_model.dart';
import '../../cubit/rewards_cubit.dart';

class RedemptionDioalogBlocBuilder extends StatelessWidget {
  const RedemptionDioalogBlocBuilder({super.key, required this.reward});

  final RewardModel reward;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, userState) {
        return ElevatedButton(
          onPressed: () async {
            final rewardsCubit = context.read<RewardsCubit>();
            context.pop();

            if (userState is UserDataSuccess) {
              await rewardsCubit.redeemReward(reward, userState.user);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            'Redeem',
            style: AppTextStyles.font14MediumBlack.copyWith(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
