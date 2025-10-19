import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/points_balance_card.dart';
import '../cubit/user_data_cubit.dart';
import '../../data/models/user_model.dart';
import '../cubit/user_data_state.dart';

class PointsSection extends StatelessWidget {
  const PointsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, userState) {
        if (userState is UserDataLoading) {
          return userLoadingState();
        }

        if (userState is UserDataError) {
          return _errorUserState(userState, context);
        }

        if (userState is UserDataSuccess) {
          return PointsBalanceCard(user: userState.user);
        }

        return const SizedBox.shrink();
      },
    );
  }

  Skeletonizer userLoadingState() {
    return Skeletonizer(
      enabled: true,
      child: PointsBalanceCard(
        user: UserModel(
          id: '1',
          name: 'Loading User Name',
          points: 1234,
          redeemedRewards: [],
        ),
      ),
    );
  }

  Container _errorUserState(UserDataError userError, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Icon(Icons.error_outline, size: 48.sp, color: AppColors.error),
          verticalSpace(12),
          Text(
            userError.message,
            style: AppTextStyles.font14RegularGrey,
            textAlign: TextAlign.center,
          ),
          verticalSpace(16),
          ElevatedButton(
            onPressed: () {
              context.read<UserDataCubit>().loadUserData();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
