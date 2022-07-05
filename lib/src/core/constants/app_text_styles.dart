import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const _fontFamily = 'Roboto';

  static TextStyle header1Styles = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 57.33.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kcBlackColor,
  );

  static TextStyle header2Styles = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 47.78.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kcBlackColor,
  );

  static TextStyle header3Styles = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 39.8.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kcBlackColor,
  );

  static TextStyle header4Styles = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 33.18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kcBlackColor,
  );

  static TextStyle subText1Style = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 27.65.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kcBlackColor,
  );

  static TextStyle subText2Style = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 23.04.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kcBlackColor,
  );

  static TextStyle subText3Style = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 19.2.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kcBlackColor,
  );

  static TextStyle bodyStyle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.kcPrimaryTextColor,
  );

  static TextStyle buttonStyle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.kcPrimaryTextColor,
  );
}
