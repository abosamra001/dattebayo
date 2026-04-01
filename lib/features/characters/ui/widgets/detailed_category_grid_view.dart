import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_dialogs.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/widgets/global_error_widget.dart';
import '../../../../core/widgets/grid_view_builder.dart';
import '../../../../core/widgets/shimmer_grid_view_builder.dart';
import '../../logic/characters_cubit.dart';
import '../../logic/characters_state.dart';

class DetailedCategoryGridView extends StatefulWidget {
  const DetailedCategoryGridView({super.key});

  @override
  State<DetailedCategoryGridView> createState() =>
      _DetailedCategoryGridViewState();
}

class _DetailedCategoryGridViewState extends State<DetailedCategoryGridView> {
  final ScrollController _scrollController = ScrollController();

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
