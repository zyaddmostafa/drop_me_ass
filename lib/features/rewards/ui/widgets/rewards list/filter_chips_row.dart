import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import 'category_filter_chip.dart';

class FilterChipsRow extends StatelessWidget {
  final String? selectedCategory;
  final Function(String?) onCategorySelected;

  const FilterChipsRow({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  static const List<String?> categories = [
    null, // all
    'Vouchers',
    'Products',
    'Charity',
    'Experiences',
    'Cashback',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: categories.length,
        separatorBuilder: (_, __) => horizontalSpace(8),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;

          return CategoryFilterChip(
            category: category,
            isSelected: isSelected,
            onTap: () => onCategorySelected(category),
          );
        },
      ),
    );
  }
}
