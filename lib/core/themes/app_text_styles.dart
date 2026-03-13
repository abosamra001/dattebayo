import 'package:dattebayo/core/helpers/font_style_helper.dart';
import 'package:dattebayo/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static final font30WhiteBrownExtraBold = TextStyle(
    fontSize: 30.sp,
    color: ColorManager.mainFontColor,
    fontWeight: FontWeightHelper.extraBold,
  );
  static final font30WhiteBrownBold = TextStyle(
    fontSize: 30.sp,
    color: ColorManager.mainFontColor,
    fontWeight: FontWeightHelper.bold,
  );
  static final font18WhiteBrownRegular = TextStyle(
    fontSize: 18.sp,
    color: ColorManager.mainFontColor,
    fontWeight: FontWeightHelper.regular,
  );

  static final font18BrownBold = TextStyle(
    fontSize: 18.sp,
    color: ColorManager.backgroundColor,
    fontWeight: FontWeightHelper.bold,
  );
}
