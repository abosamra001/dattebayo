import 'package:dattebayo/core/widgets/grid_view_builder.dart';
import 'package:dattebayo/core/widgets/shimmer_grid_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_dialogs.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/widgets/global_error_widget.dart';
import '../../logic/characters_cubit.dart';
import '../../logic/characters_state.dart';

class AllCharactersGridView extends StatefulWidget {
  const AllCharactersGridView({super.key});

  @override
  State<AllCharactersGridView> createState() => _AllCharactersGridViewState();
}

class _AllCharactersGridViewState extends State<AllCharactersGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final position = _scrollController.position;
      final isAtBottom = position.pixels >= position.maxScrollExtent - 200;

      if (!isAtBottom) return;
      final currentState = context.read<CharactersCubit>().state;

      if (currentState is CharactersSuccess ||
          currentState is CharactersLoading) {
        context.read<CharactersCubit>().getAllCharacters();
      } else if (currentState is CharactersSearchSuccess) {
        context.read<CharactersCubit>().searchCharactersByName();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
          charactersLoading: () => const ShimmerGridViewBuilder(),
          charactersLoadingMore: (characters) => GridViewBuilder(
            storageKey: 'characters_grid',
            controller: _scrollController,
            itemsList: characters,
            isLoadingMore: true,
          ),
          charactersSuccess: (characters) => GridViewBuilder(
            storageKey: 'characters_grid',
            controller: _scrollController,
            itemsList: characters,
          ),
          charactersSearchSuccess: (characters) => GridViewBuilder(
            storageKey: 'searching_characters_grid',
            controller: _scrollController,
            itemsList: characters,
          ),
          charactersError: (error) {
            final characters = context.read<CharactersCubit>().characters;
            return characters.isNullOrEmpty
                ? GlobalErrorWidget(error: error)
                : GridViewBuilder(
                    storageKey: 'characters_grid',
                    controller: _scrollController,
                    itemsList: characters,
                  );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
