import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/points_section.dart';
import '../widgets/rvm_list_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Drop Me',
        showBackButton: false,
        suffixIcon: IconButton(
          icon: const Icon(Icons.notifications_outlined),
          color: AppColors.textPrimary,
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(8),

            const PointsSection(),

            verticalSpace(16),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                '📍 Nearby RVMs',
                style: AppTextStyles.font18SemiBoldBlack,
              ),
            ),

            verticalSpace(12),

            const RvmListSection(),

            verticalSpace(80), // Extra space for FAB
          ],
        ),
      ),
    );
  }
}
