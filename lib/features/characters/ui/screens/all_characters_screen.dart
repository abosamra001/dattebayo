import 'package:dattebayo/core/themes/app_text_styles.dart';
import 'package:dattebayo/core/themes/colors.dart';
import 'package:dattebayo/features/characters/data/models/character_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/uzumaki_loading_indicator.dart';
import '../../logic/characters_cubit.dart';
import '../../logic/characters_state.dart';
import '../widgets/character_card.dart';

class AllCharactersScreen extends StatefulWidget {
  const AllCharactersScreen({super.key});

  @override
  State<AllCharactersScreen> createState() => _AllCharactersScreenState();
}

class _AllCharactersScreenState extends State<AllCharactersScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final position = _scrollController.position;
      final isAtBottom = position.pixels >= position.maxScrollExtent - 200;

      if (isAtBottom) {
        context.read<CharactersCubit>().getAllCharacters();
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
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Discover Shinobis',
          style: AppTextStyles.font20MainOrangeBold,
        ),
        centerTitle: true,
        foregroundColor: ColorManager.mainColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.arrowDownShortWide),
          ),
        ],
        actionsPadding: const EdgeInsets.only(right: 16),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            return state.maybeWhen(
              charactersLoading: () =>
                  const Center(child: UzumakiLoadingIndicator()),
              charactersLoadingMore: (characters) =>
                  _buildCharacterList(characters, true),
              charactersSuccess: (characters) =>
                  _buildCharacterList(characters, false),
              charactersError: (error) {
                return Center(child: Text(error));
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCharacterList(
    List<CharacterModel> characters,
    bool isLoadingMore,
  ) {
    return GridView.builder(
      controller: _scrollController,
      itemCount: characters.length + (isLoadingMore ? 1 : 0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 170 / 270,
      ),
      itemBuilder: (context, index) {
        print("========== length is = ${characters.length} at index $index");
        if (index == characters.length) {
          return const Center(child: UzumakiLoadingIndicator());
        }
        return CharacterCard(character: characters[index]);
      },
    );
  }
}
