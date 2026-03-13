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
          width: 50.w,
          height: 50.h,
        ),
        Text('DATTEBAYO', style: AppTextStyles.font30WhiteBrownExtraBold),
      ],
    );
  }
}
