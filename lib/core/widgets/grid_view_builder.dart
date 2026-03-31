import 'package:dattebayo/features/characters/data/models/character_response_model.dart';
import 'package:flutter/material.dart';

import '../../features/characters/ui/widgets/character_card.dart';
import 'uzumaki_loading_indicator.dart';

class GridViewBuilder extends StatelessWidget {
  final String storageKey;
  final ScrollController controller;
  final List<CharacterModel> itemsList;
  final bool isLoadingMore;
  const GridViewBuilder({
    super.key,
    required this.storageKey,
    required this.controller,
    required this.itemsList,
    this.isLoadingMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: PageStorageKey(storageKey),
      controller: controller,
      itemCount: itemsList.length + (isLoadingMore ? 1 : 0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 170 / 270,
      ),
      itemBuilder: (context, index) {
        if (isLoadingMore && index == itemsList.length) {
          return const Center(child: UzumakiLoadingIndicator());
        }
        return CharacterCard(character: itemsList[index]);
      },
    );
  }
}
