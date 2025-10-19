import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extention.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../cubit/rewards_cubit.dart';
import '../cubit/rewards_state.dart';
import '../../data/models/reward_model.dart';
import '../widgets/rewards details/availability_info_card.dart';
import '../widgets/rewards details/category_chip.dart';
import '../widgets/rewards details/points_cost_card.dart';
import '../widgets/rewards details/redemption_bottom_bar.dart';
import '../widgets/rewards details/reward_details_app_bar.dart';
import '../../../home/data/models/user_model.dart';

class RewardDetailsScreen extends StatelessWidget {
  final RewardModel reward;
  final UserModel user;

  const RewardDetailsScreen({
    super.key,
    required this.reward,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<RewardsCubit, RewardsState>(
      listener: (context, state) {
        if (state is RedemptionSuccess) {
          context.pushReplacementNamed(
            Routes.redemptionSuccess,
            arguments: state,
          );
        } else if (state is RedemptionFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            RewardDetailsAppBar(reward: reward),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(reward.name, style: AppTextStyles.font24SemiBoldBlack),
                    verticalSpace(8),

                    CategoryChip(category: reward.category),
                    verticalSpace(16),

                    PointsCostCard(reward: reward, user: user),
                    verticalSpace(24),

                    Text(
                      'Description',
                      style: AppTextStyles.font18SemiBoldBlack,
                    ),
                    verticalSpace(8),

                    Text(
                      reward.description,
                      style: AppTextStyles.font14RegularBlack.copyWith(
                        height: 1.5,
                      ),
                    ),
                    verticalSpace(24),

                    if (reward.terms.isNotEmpty) ...[
                      Text(
                        'Terms & Conditions',
                        style: AppTextStyles.font18SemiBoldBlack,
                      ),
                      verticalSpace(8),
                      Text(
                        reward.terms,
                        style: AppTextStyles.font12RegularGrey.copyWith(
                          height: 1.5,
                        ),
                      ),
                      verticalSpace(24),
                    ],

                    AvailabilityInfoCard(reward: reward),
                    verticalSpace(100), // Space for bottom button
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: RedemptionBottomBar(reward: reward, user: user),
      ),
    );
  }
}
