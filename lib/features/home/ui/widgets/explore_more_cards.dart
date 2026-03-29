import 'package:dattebayo/core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/themes/app_text_styles.dart';
import 'explore_more_item.dart';

class ExploreMoreCards extends StatelessWidget {
  const ExploreMoreCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('Explore More', style: AppTextStyles.font20WhiteBrownBold),
        verticalSpace(16),
        Row(
          children: [
            ExploreMoreItem(
              onTap: () {
                context.pushNamed(
                  Routes.simpleCategoryScreen,
                  arguments: SimpleCategoryType.clans,
                );
              },
              icon: FontAwesomeIcons.peopleRoof,
              label: 'Clans',
            ),
            const Spacer(),
            ExploreMoreItem(
              onTap: () {
                context.pushNamed(
                  Routes.simpleCategoryScreen,
                  arguments: SimpleCategoryType.villages,
                );
              },
              icon: FontAwesomeIcons.vihara,
              label: 'Villages',
            ),
          ],
        ),
        verticalSpace(16),
        Row(
          children: [
            ExploreMoreItem(
              onTap: () {
                context.pushNamed(
                  Routes.simpleCategoryScreen,
                  arguments: SimpleCategoryType.teams,
                );
              },
              icon: FontAwesomeIcons.peopleGroup,
              label: 'Teams',
            ),
            const Spacer(),
            ExploreMoreItem(
              onTap: () {},
              icon: FontAwesomeIcons.solidCloud,
              label: 'Akatsuki',
            ),
          ],
        ),
        verticalSpace(16),
        Row(
          children: [
            ExploreMoreItem(
              onTap: () {
                context.pushNamed(
                  Routes.simpleCategoryScreen,
                  arguments: SimpleCategoryType.kekkeiGenkai,
                );
              },
              icon: FontAwesomeIcons.hurricane,
              label: 'Kekkei-Genkai',
            ),
            const Spacer(),
            ExploreMoreItem(
              onTap: () {},
              icon: FontAwesomeIcons.optinMonster,
              label: 'tailed-beasts',
            ),
          ],
        ),
      ],
    );
  }
}
