import 'package:dattebayo/core/helpers/constants.dart';
import 'package:dattebayo/core/helpers/prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/themes/colors.dart';

class StartYourNinjaWay extends StatelessWidget {
  const StartYourNinjaWay({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PrefsService.setBool(Constants.isFirstTime, false);
        context.pushReplacementNamed(Routes.home);
      },
      child: Container(
        width: 350.w,
        height: 45.h,
        alignment: .center,
        decoration: BoxDecoration(
          color: ColorManager.mainColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          'Start Your Ninja Way',
          style: AppTextStyles.font18BrownBold,
        ),
      ),
    );
  }
}
