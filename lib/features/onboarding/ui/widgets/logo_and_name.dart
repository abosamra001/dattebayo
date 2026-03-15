import 'package:dattebayo/core/helpers/font_style_helper.dart';
import 'package:dattebayo/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoAndName extends StatelessWidget {
  const LogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      mainAxisSize: .min,
      children: [
        Image.asset(
          'assets/images/png/uzumaki_logo.png',
          width: 56.w,
          height: 56.h,
        ),
        Text(
          'DATTEBAYO',
          style: AppTextStyles.font40WhiteBrownLight.copyWith(
            fontFamily: 'Ninja',
            fontWeight: FontWeightHelper.regular,
            fontSize: 40,
          ),
        ),
      ],
    );
  }
}
