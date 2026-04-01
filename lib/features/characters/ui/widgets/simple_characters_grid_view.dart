import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_dialogs.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/widgets/global_error_widget.dart';
import '../../../../core/widgets/grid_view_builder.dart';
import '../../../../core/widgets/shimmer_grid_view_builder.dart';
import '../../logic/characters_cubit.dart';
import '../../logic/characters_state.dart';

class SimpleCharactersGridView extends StatefulWidget {
  const SimpleCharactersGridView({super.key});

  @override
  State<SimpleCharactersGridView> createState() =>
      _SimpleCharactersGridViewState();
}

class _SimpleCharactersGridViewState extends State<SimpleCharactersGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_addPagination);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_addPagination);
    _scrollController.dispose();
    super.dispose();
  }

  void _addPagination() {
    final position = _scrollController.position;
    final isAtBottom = position.pixels >= position.maxScrollExtent - 200;

    if (!isAtBottom) return;
    context.read<CharactersCubit>().getCharactersById();
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
