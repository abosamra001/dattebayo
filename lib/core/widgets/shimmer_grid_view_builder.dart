import 'package:flutter/material.dart';

import '../../features/characters/ui/widgets/characters_shimmer_loading.dart';

class ShimmerGridViewBuilder extends StatelessWidget {
  const ShimmerGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
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
