import 'package:dattebayo/core/helpers/font_style_helper.dart';
import 'package:dattebayo/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  // main orange
  static final font12MainOrangeBold = TextStyle(
    fontSize: 12.sp,
    color: ColorManager.mainColor,
    fontWeight: FontWeightHelper.bold,
  );
  static final font14MainOrangeSemiBold = TextStyle(
    fontSize: 14.sp,
    color: ColorManager.mainColor,
    fontWeight: FontWeightHelper.semiBold,
  );
  static final font20MainOrangeBold = TextStyle(
    fontSize: 20.sp,
    color: ColorManager.mainColor,
    fontWeight: FontWeightHelper.bold,
  );

  // white
  static final font10WhiteBold = TextStyle(
    fontSize: 10.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static final font14WhiteBold = TextStyle(
    fontSize: 14.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static final font20WhiteBold = TextStyle(
    fontSize: 20.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static final font36WhiteExtraBold = TextStyle(
    fontSize: 36.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.extraBold,
  );

  // white brown
  static final font14WhiteBrownBold = TextStyle(
    fontSize: 14.sp,
    color: ColorManager.mainFontColor,
    fontWeight: FontWeightHelper.bold,
  );
  static final font16WhiteBrownMedium = TextStyle(
    fontSize: 16.sp,
    color: ColorManager.mainFontColor,
    fontWeight: FontWeightHelper.medium,
  );
  static final font18WhiteBrownRegular = TextStyle(
    fontSize: 18.sp,
    color: ColorManager.mainFontColor,
    fontWeight: FontWeightHelper.regular,
  );
  static final font20WhiteBrownBold = TextStyle(
    fontSize: 20.sp,
    color: ColorManager.mainFontColor,
    fontWeight: FontWeightHelper.bold,
  );
  static final font40WhiteBrownLight = TextStyle(
    fontSize: 40.sp,
    color: ColorManager.mainFontColor,
    fontWeight: FontWeightHelper.light,
  );
  static final font30WhiteBrownBold = TextStyle(
    fontSize: 30.sp,
    color: ColorManager.mainFontColor,
    fontWeight: FontWeightHelper.bold,
  );

  // brown
  static final font18BrownBold = TextStyle(
    fontSize: 18.sp,
    color: ColorManager.backgroundColor,
    fontWeight: FontWeightHelper.bold,
  );

  // blue gray
  static final font12BlueGrayBold = TextStyle(
    fontSize: 12.sp,
    color: ColorManager.blueGray,
    fontWeight: FontWeightHelper.bold,
  );
  static final font14BlueGrayReqular = TextStyle(
    fontSize: 14.sp,
    color: ColorManager.blueGray,
    fontWeight: FontWeightHelper.regular,
  );
}
