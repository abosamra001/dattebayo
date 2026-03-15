import 'package:dattebayo/core/helpers/spacer.dart';
import 'package:dattebayo/features/onboarding/ui/widgets/start_your_ninja_way.dart';
import 'package:dattebayo/features/onboarding/ui/widgets/welcome_shinobi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/logo_and_name.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            crossAxisAlignment: .center,
            children: [
              const LogoAndName(),
              const Expanded(child: WelcomeShinobi()),
              verticalSpace(30),
              const StartYourNinjaWay(),
            ],
          ),
        ),
      ),
    );
  }
}
