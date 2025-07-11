import 'package:flutter/material.dart';

import 'color_theme/color_tokens.dart';

class _Size {
  static const double s9 = 9.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s26 = 26.0;
  static const double s36 = 36.0;
  static const double s52 = 52.0;
  static const double s72 = 72.0;
}

abstract class AppTextStyles {
  static const _baseTextStyle = TextStyle(
    fontFamily: _baseFontFamily,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const _baseFontFamily = 'Poppins-Regular';


  //////--------semiBold----------//////

  static final text24semiBold = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: _Size.s24,
  );

  static final text24semiBoldWhite = text24semiBold.copyWith(color: AppColors.honeyDrew);
}
