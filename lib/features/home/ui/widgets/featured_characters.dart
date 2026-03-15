import 'package:dattebayo/core/helpers/extensions.dart';
import 'package:dattebayo/core/helpers/spacer.dart';
import 'package:dattebayo/core/routing/routes.dart';
import 'package:dattebayo/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'character_item.dart';

class FeaturedCharacters extends StatelessWidget {
  const FeaturedCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390.w,
      height: 420.h,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Text(
                'Featured Characters',
                style: AppTextStyles.font20WhiteBrownBold,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.charactersScreen);
                },
                child: Text(
                  'View All',
                  style: AppTextStyles.font14MainOrangeSemiBold,
                ),
              ),
            ],
          ),
          verticalSpace(12),
          Expanded(
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              itemCount: 3,
              itemBuilder: (context, i) => CharacterItem(
                onTap: () {},
                image: 'assets/images/png/onboarding_background.png',
                name: 'Naruto Uzumaki',
                occupation: 'The Orange Hokage',
                team: 'Team 7',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
