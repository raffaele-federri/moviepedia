import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/app_colors.dart';

class AppTextStyles {
  /// font-size:12
  static final grey12w400 = GoogleFonts.poppins(
    fontSize: 12,
    color: AppColors.textGrey,
    fontWeight: FontWeight.w400,
  );
  static final white12w400 = GoogleFonts.poppins(
    fontSize: 12,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );
  static final white12w500 = GoogleFonts.poppins(
    fontSize: 12,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );
  static final orange12w600 = GoogleFonts.montserrat(
    fontSize: 12,
    color: AppColors.orange,
    fontWeight: FontWeight.w600,
  );

  /// font-size:14
  static final white14w500 = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );
  static final white14w600 = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );
  static final blue14w500 = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.bottomNavItemSelected,
    fontWeight: FontWeight.w500,
  );

  /// font-size:18
  static final white18w600 = GoogleFonts.poppins(
    fontSize: 18,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );
}
