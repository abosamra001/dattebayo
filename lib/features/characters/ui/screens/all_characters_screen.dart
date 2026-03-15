import 'package:dattebayo/core/themes/colors.dart';
import 'package:flutter/material.dart';

class AllCharactersScreen extends StatelessWidget {
  const AllCharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: AppBar(),
      body: const Center(child: Text('All Characters Screen')),
    );
  }
}
