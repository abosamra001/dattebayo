import 'package:dattebayo/core/helpers/spacer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              icon: FontAwesomeIcons.peopleRoof,
              label: 'Clans',
              onTap: () {},
            ),
            const Spacer(),
            ExploreMoreItem(
              icon: FontAwesomeIcons.vihara,
              label: 'Villages',
              onTap: () {},
            ),
          ],
        ),
        verticalSpace(16),
        Row(
          children: [
            ExploreMoreItem(
              icon: FontAwesomeIcons.peopleGroup,
              label: 'Teams',
              onTap: () {},
            ),
            const Spacer(),
            ExploreMoreItem(
              icon: FontAwesomeIcons.solidCloud,
              label: 'Akatsuki',
              onTap: () {},
            ),
          ],
        ),
        verticalSpace(16),
        Row(
          children: [
            ExploreMoreItem(
              icon: FontAwesomeIcons.hurricane,
              label: 'Kekkei-Genkai',
              onTap: () {},
            ),
            const Spacer(),
            ExploreMoreItem(
              icon: FontAwesomeIcons.optinMonster,
              label: 'tailed-beasts',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
