import 'package:dattebayo/core/helpers/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/uzumaki_loading_indicator.dart';
import '../../data/models/character_response_model.dart';
import '../../logic/characters_cubit.dart';
import '../../logic/characters_state.dart';
import 'character_card.dart';
import 'characters_shimmer_loading.dart';

class CharactersGridView extends StatefulWidget {
  const CharactersGridView({super.key});

  @override
  State<CharactersGridView> createState() => _CharactersGridViewState();
}

class _CharactersGridViewState extends State<CharactersGridView> {
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
          charactersLoading: () => _buildShimmerLoading(),
          charactersLoadingMore: (characters) =>
              _buildCharacterList(characters: characters, isLoadingMore: true),
          charactersSuccess: (characters) =>
              _buildCharacterList(characters: characters),
          charactersSearchSuccess: (characters) =>
              _buildCharacterList(characters: characters),
          charactersError: (error) =>
              Center(child: Image.asset('assets/images/png/error_3.png')),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildCharacterList({
    required List<CharacterModel> characters,
    bool isLoadingMore = false,
  }) {
    return GridView.builder(
      key: const PageStorageKey('characters_grid'),
      controller: _scrollController,
      itemCount: characters.length + (isLoadingMore ? 1 : 0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 170 / 270,
      ),
      itemBuilder: (context, index) {
        if (index == characters.length) {
          return const Center(child: UzumakiLoadingIndicator());
        }
        return CharacterCard(character: characters[index]);
      },
    );
  }

  Widget _buildShimmerLoading() {
    return GridView.builder(
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 170 / 270,
      ),
      itemBuilder: (context, index) {
        return const CharactersShimmerLoading();
      },
    );
  }
}
