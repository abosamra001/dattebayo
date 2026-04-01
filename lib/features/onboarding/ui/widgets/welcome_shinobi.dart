import 'package:flutter/material.dart';

import '../../../../core/helpers/spacer.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/themes/colors.dart';

class WelcomeShinobi extends StatelessWidget {
  const WelcomeShinobi({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: .bottomCenter,
      children: [
        Container(
          alignment: .center,
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorManager.backgroundColor,
                ColorManager.backgroundColor.withAlpha(0),
              ],
              begin: .bottomCenter,
              end: .topCenter,
              stops: const [0.2, 0.8],
            ),
          ),
          child: Image.asset('assets/images/png/onboarding_background.png'),
        ),
        Column(
          mainAxisAlignment: .end,
          mainAxisSize: .min,
          children: [
            Text(
              'Welcome, Shinobi!',
              style: AppTextStyles.font30WhiteBrownBold,
            ),
            verticalSpace(10),
            Text(
              'Discover the secrets of clans,\nvillages, and legendary characters.\nYour ninja guide is ready.\nDattebayo!',
              style: AppTextStyles.font18WhiteBrownRegular,
              textAlign: .center,
            ),
          ],
        ),
      ],
    );
  }
}
