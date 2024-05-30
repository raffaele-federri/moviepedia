import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/app_colors.dart';

class AppTextStyles {
  static final white18w500 = GoogleFonts.poppins(
    fontSize: 18,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );
  static final white14w400 = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );static final blue14w400 = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.bottomNavItemSelected,
    fontWeight: FontWeight.w400,
  );

}
