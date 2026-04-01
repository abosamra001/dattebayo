import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widgets/uzumaki_loading_indicator.dart';
import '../../data/models/character_response_model.dart';

class CharacterCard extends StatelessWidget {
  final CharacterModel character;
  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.characterDetailsScreen,
        arguments: character,
      ),
      child: Container(
        width: 170.w,
        height: 270.h,
        clipBehavior: .antiAlias,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            Stack(
              alignment: .topEnd,
              children: [
                // photo
                CachedNetworkImage(
                  width: 170.w,
                  height: 192.h,
                  fit: .cover,
                  imageUrl: character.images?.firstOrNull ?? '',
                  placeholder: (context, url) =>
                      const Center(child: UzumakiLoadingIndicator()),
                  errorWidget: (context, url, error) {
                    return Column(
                      mainAxisAlignment: .center,
                      children: [
                        const FaIcon(FontAwesomeIcons.exclamation, size: 36),
                        verticalSpace(16),
                        Text(
                          'No Photo Found',
                          style: AppTextStyles.font14BlueGrayReqular,
                        ),
                      ],
                    );
                  },
                ),
                // occupation
                Container(
                  constraints: BoxConstraints(maxWidth: 170.w),
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 12.w,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: .5),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    character.personal?.occupation?.firstOrNull ?? 'No Rank',
                    style: AppTextStyles.font10WhiteBold,
                    overflow: .ellipsis,
                  ),
                ),
              ],
            ),
            // name and place
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      character.name ?? 'Ninja',
                      style: AppTextStyles.font14MainOrangeSemiBold,
                      overflow: .ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      character.personal?.affiliation?.firstOrNull ?? 'Unknown',
                      style: AppTextStyles.font14BlueGrayReqular,
                      overflow: .ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
