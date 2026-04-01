import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_dialogs.dart';
import '../../../../core/widgets/global_error_widget.dart';
import '../../../characters/logic/characters_cubit.dart';
import '../../../characters/logic/characters_state.dart';
import 'character_item.dart';
import 'featured_shimmer_loading.dart';

class FeaturedPageView extends StatelessWidget {
  const FeaturedPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharactersCubit, CharactersState>(
      listener: (context, state) {
        state.maybeWhen(
          charactersError: (error) =>
              AppDialogs.showErrorDialog(context, error),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          charactersLoading: () => PageView.builder(
            controller: PageController(viewportFraction: 0.84),
            itemCount: 4,
            itemBuilder: (context, i) => const FeaturedShimmerLoading(),
          ),
          charactersSuccess: (characters) => PageView.builder(
            controller: PageController(viewportFraction: 0.84),
            itemCount: characters.take(5).length,
            itemBuilder: (context, i) =>
                CharacterItem(characterModel: characters[i]),
          ),
          charactersError: (error) => GlobalErrorWidget(error: error),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
