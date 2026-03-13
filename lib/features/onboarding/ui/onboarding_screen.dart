import 'package:dattebayo/core/helpers/extensions.dart';
import 'package:dattebayo/core/helpers/spacer.dart';
import 'package:dattebayo/core/routing/routes.dart';
import 'package:dattebayo/core/themes/app_text_styles.dart';
import 'package:dattebayo/core/themes/colors.dart';
import 'package:dattebayo/features/onboarding/ui/widgets/welcome_shinobi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/logo_and_name.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            crossAxisAlignment: .center,
            children: [
              const LogoAndName(),
              Expanded(child: const WelcomeShinobi()),
              verticalSpace(30),
              // todo: refactor this later
              GestureDetector(
                onTap: () {
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
