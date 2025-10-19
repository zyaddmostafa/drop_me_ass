import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/extention.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final double? elevation;
  final TextStyle? titleStyle;
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.suffixIcon,
    this.backgroundColor,
    this.elevation,
    this.titleStyle,
    this.leadingIcon,
    this.leadingIconColor,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation ?? 0,
      leading: showBackButton
          ? IconButton(
              icon: Icon(
                leadingIcon ?? Icons.arrow_back_ios_new_rounded,
                color: leadingIconColor ?? AppColors.textPrimary,
                size: 20.sp,
              ),
              onPressed: onBackPressed ?? () => context.pop(),
            )
          : null,
      automaticallyImplyLeading: showBackButton,
      title: Text(
        title,
        style: titleStyle ?? AppTextStyles.font20SemiBoldBlack,
      ),
      centerTitle: centerTitle,
      actions: suffixIcon != null ? [suffixIcon!] : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
