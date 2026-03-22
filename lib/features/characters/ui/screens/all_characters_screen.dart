import 'dart:async';

import 'package:dattebayo/features/characters/logic/characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/helpers/spacer.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/widgets/top_search_bar.dart';
import '../widgets/characters_grid_view.dart';

class AllCharactersScreen extends StatefulWidget {
  const AllCharactersScreen({super.key});

  @override
  State<AllCharactersScreen> createState() => _AllCharactersScreenState();
}

class _AllCharactersScreenState extends State<AllCharactersScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void dispose() {
    _searchController.dispose();
    _debounceTimer?.cancel();
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
            onPressed: () {
              context.read<CharactersCubit>().filterByName();
            },
            icon: const FaIcon(FontAwesomeIcons.arrowDownShortWide),
          ),
        ],
        actionsPadding: const EdgeInsets.only(right: 16),
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            TopSearchBar(
              onSubmitted: (query) {
                _debounceTimer?.cancel();
                context.read<CharactersCubit>().searchCharactersByName(
                  name: query,
                );
              },
              onChanged: onSearchingChanged,
              controller: _searchController,
              hintText: 'Search in narturo characters',
            ),
            verticalSpace(16),
            const Expanded(child: CharactersGridView()),
          ],
        ),
      ),
    );
  }

  void onSearchingChanged(String? query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 750), () {
      context.read<CharactersCubit>().searchCharactersByName(name: query);
    });
  }
}
