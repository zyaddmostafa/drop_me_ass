import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/rvm_model.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'rvm_card.dart';

class RvmListSection extends StatelessWidget {
  const RvmListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, rvmsState) {
        if (rvmsState is NearByRVMsLoading) {
          return nearbyRVMsLoading();
        }

        if (rvmsState is NearByRVMsError) {
          return nearbyRVMsErorr(rvmsState, context);
        }

        if (rvmsState is NearByRVMsSuccess) {
          final nearbyRVMs = rvmsState.nearbyRVMs;

          return nearbyRVMsSuccess(nearbyRVMs);
        }

        return const SizedBox.shrink();
      },
    );
  }

  Column nearbyRVMsSuccess(List<RvmModel> nearbyRVMs) {
    return Column(
      children: nearbyRVMs
          .map(
            (rvm) => RvmCard(
              rvm: rvm,
              onTap: () {
                // Handle RVM card tap
              },
            ),
          )
          .toList(),
    );
  }

  Skeletonizer nearbyRVMsLoading() {
    return Skeletonizer(
      child: Column(
        children: List.generate(
          3,
          (index) => RvmCard(rvm: RvmModel.mockData[0], onTap: () {}),
        ),
      ),
    );
  }

  Center nearbyRVMsErorr(NearByRVMsError rvmsError, BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            Icon(Icons.error_outline, size: 48.sp, color: AppColors.error),
            verticalSpace(12),
            Text(
              rvmsError.message,
              style: AppTextStyles.font14RegularGrey,
              textAlign: TextAlign.center,
            ),
            verticalSpace(16),
            ElevatedButton(
              onPressed: () {
                context.read<HomeCubit>().loadNearbyRVMs();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
