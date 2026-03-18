import 'package:dattebayo/core/helpers/extensions.dart';
import 'package:dattebayo/core/helpers/spacer.dart';
import 'package:dattebayo/core/routing/routes.dart';
import 'package:dattebayo/core/themes/app_text_styles.dart';
import 'package:dattebayo/core/widgets/uzumaki_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../characters/logic/characters_cubit.dart';
import '../../../characters/logic/characters_state.dart';
import 'character_item.dart';

class FeaturedCharacters extends StatelessWidget {
  const FeaturedCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        return state.maybeWhen(
          charactersLoading: () => const Center(
            child: UzumakiLoadingIndicator(),
          ), // todo: replace this with shimmer
          charactersSuccess: (characters) => SizedBox(
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
                    controller: PageController(viewportFraction: 0.84),
                    itemCount: characters.length,
                    itemBuilder: (context, i) =>
                        CharacterItem(characterModel: characters[i]),
                  ),
                ),
              ],
            ),
          ),
          charactersError: (error) {
            return Center(child: Text(error));
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
