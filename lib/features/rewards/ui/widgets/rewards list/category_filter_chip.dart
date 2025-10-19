import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CategoryFilterChip extends StatelessWidget {
  final String? category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryFilterChip({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  String get categoryLabel => category ?? 'All';

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(categoryLabel),
      selected: isSelected,
      onSelected: (_) => onTap(),
      backgroundColor: Colors.white,
      selectedColor: AppColors.primary,
      labelStyle: AppTextStyles.font14MediumBlack.copyWith(
        color: isSelected ? Colors.white : AppColors.textPrimary,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
      side: BorderSide(
        color: isSelected ? AppColors.primary : Colors.grey[300]!,
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
    );
  }
}
