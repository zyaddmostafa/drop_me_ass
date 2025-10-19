import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/extention.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../home/ui/cubit/user_data_cubit.dart';
import '../../cubit/rewards_cubit.dart';
import '../../../data/models/reward_model.dart';
import 'redemption_dioalog_bloc_builder.dart';

class RedemptionDialog extends StatelessWidget {
  final RewardModel reward;
  final dynamic user;

  const RedemptionDialog({super.key, required this.reward, required this.user});

  static void show(BuildContext context, RewardModel reward, user) {
    showDialog(
      context: context,
      builder: (dialogContext) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<RewardsCubit>()),
          BlocProvider.value(value: context.read<UserDataCubit>()),
        ],
        child: RedemptionDialog(reward: reward, user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      title: Text(
        'Confirm Redemption',
        style: AppTextStyles.font20SemiBoldBlack,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Are you sure you want to redeem:',
            style: AppTextStyles.font14RegularBlack,
          ),
          verticalSpace(12),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reward.name, style: AppTextStyles.font16BoldBlack),
                verticalSpace(4),
                Row(
                  children: [
                    Icon(
                      Icons.monetization_on,
                      size: 16.sp,
                      color: AppColors.secondary,
                    ),
                    horizontalSpace(4),
                    Text(
                      '${reward.pointCost} points',
                      style: AppTextStyles.font14MediumBlack.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(12),
          Text(
            'Your points will be deducted immediately.',
            style: AppTextStyles.font12RegularGrey,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(
            'Cancel',
            style: AppTextStyles.font14MediumBlack.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        RedemptionDioalogBlocBuilder(reward: reward),
      ],
    );
  }
}
