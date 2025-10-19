import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  // ========== HEADLINES (Poppins - Bold/SemiBold) ==========

  /// 32sp Bold Poppins - Large page titles
  static TextStyle get font32BoldBlack => GoogleFonts.poppins(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  /// 24sp SemiBold Poppins - Section headers
  static TextStyle get font24SemiBoldBlack => GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  /// 20sp SemiBold Poppins - Card titles
  static TextStyle get font20SemiBoldBlack => GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  /// 18sp SemiBold Poppins - Sub-section headers
  static TextStyle get font18SemiBoldBlack => GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  /// 18sp Bold Poppins - Sub-section headers (Bold)
  static TextStyle get font18BoldBlack => GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  /// 16sp Bold Poppins - Small headers
  static TextStyle get font16BoldBlack => GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // ========== BODY TEXT (Inter - Regular/Medium) ==========

  /// 16sp Regular Inter - Main content
  static TextStyle get font16RegularBlack => GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  /// 16sp Medium Inter - Emphasized content
  static TextStyle get font16MediumBlack => GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  /// 14sp Regular Inter - Standard text
  static TextStyle get font14RegularBlack => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  /// 14sp Medium Inter - Emphasized text
  static TextStyle get font14MediumBlack => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  /// 12sp Regular Inter - Secondary text
  static TextStyle get font12RegularGrey => GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  /// 12sp Medium Inter - Emphasized small text
  static TextStyle get font12MediumGrey => GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  /// 12sp Medium Inter Black - Emphasized small text
  static TextStyle get font12MediumBlack => GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  /// 10sp Regular Inter - Caption text
  static TextStyle get font10RegularGrey => GoogleFonts.inter(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // ========== BUTTONS (Inter - Medium) ==========

  /// 16sp Medium Inter White - Large buttons
  static TextStyle get font16MediumWhite => GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  /// 14sp Medium Inter White - Standard buttons
  static TextStyle get font14MediumWhite => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  /// 12sp Medium Inter White - Small buttons
  static TextStyle get font12MediumWhite => GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  // ========== SPECIAL STYLES ==========

  /// 32sp Bold Poppins Gold - Points display
  static TextStyle get font32BoldGold => GoogleFonts.poppins(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.secondary,
  );

  /// 24sp Bold Poppins - Large headers
  static TextStyle get font24BoldBlack => GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  /// 24sp Bold Poppins Gold - Small points display
  static TextStyle get font24BoldGold => GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.secondary,
  );

  /// 12sp Medium Inter - Chip text
  static TextStyle get font12MediumChip => GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3,
  );

  /// 28sp Bold Poppins Green - Success title
  static TextStyle get font28BoldGreen => GoogleFonts.poppins(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.success,
  );

  /// 12sp Bold Inter White - Tier badge
  static TextStyle get font12BoldWhite => GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 1.0,
  );

  // ========== WHITE VARIANTS ==========

  /// 24sp SemiBold Poppins White
  static TextStyle get font24SemiBoldWhite => GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  /// 20sp SemiBold Poppins White
  static TextStyle get font20SemiBoldWhite => GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  /// 16sp Regular Inter White
  static TextStyle get font16RegularWhite => GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    height: 1.5,
  );

  /// 14sp Regular Inter White
  static TextStyle get font14RegularWhite => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    height: 1.5,
  );

  /// 12sp Regular Inter White70
  static TextStyle get font12RegularWhite70 => GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
    height: 1.5,
  );

  // ========== SECONDARY COLOR VARIANTS ==========

  /// 16sp Regular Inter Grey
  static TextStyle get font16RegularGrey => GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  /// 14sp Regular Inter Grey
  static TextStyle get font14RegularGrey => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // ========== PRIMARY COLOR VARIANTS ==========

  /// 16sp Medium Inter Green
  static TextStyle get font16MediumGreen => GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  /// 14sp Medium Inter Green
  static TextStyle get font14MediumGreen => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
}
