import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themes/app_text_styles.dart';
import 'featured_page_view.dart';

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
          const Expanded(child: FeaturedPageView()),
        ],
      ),
    );
  }
}
