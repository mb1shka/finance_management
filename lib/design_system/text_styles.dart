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
  static const double s30 = 30.0;
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

  //////--------regular----------//////

  static final text12Regular = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: _Size.s12,
  );

  static final text14Regular = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: _Size.s14,
  );

  static final text20Regular = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: _Size.s20,
  );

  static final text26Regular = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: _Size.s26,
  );

  static final text26RegularWhite = text26Regular.copyWith(color: AppColors.honeyDrew);


  //////--------medium----------//////

  static final text26Medium = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: _Size.s26,
  );

  static final text26MediumWhite = text26Medium.copyWith(color: AppColors.honeyDrew);

  //////--------semiBold----------//////

  static final text24semiBold = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: _Size.s24,
  );

  static final text24semiBoldWhite = text24semiBold.copyWith(color: AppColors.honeyDrew);


  //////----------bold------------//////

  static final text24Bold = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: _Size.s24,
  );

  static final text24BoldWhite = text24Bold.copyWith(color: AppColors.honeyDrew);
  static final text24BoldOceanBlue = text24Bold.copyWith(color: AppColors.oceanBlue);
}
