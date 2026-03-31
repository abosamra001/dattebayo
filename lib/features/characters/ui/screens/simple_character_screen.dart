import 'package:dattebayo/core/helpers/extensions.dart';
import 'package:dattebayo/core/widgets/network_bloc_listener.dart';
import 'package:dattebayo/features/characters/ui/widgets/simple_characters_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/app_text_styles.dart';
import '../../../explore/data/models/simple_category_model.dart';
import '../../logic/characters_cubit.dart';

class SimpleCharactersScreen extends StatefulWidget {
  final SimpleCategoryModel simpleCategoryModel;
  const SimpleCharactersScreen({super.key, required this.simpleCategoryModel});

  @override
  State<SimpleCharactersScreen> createState() => _SimpleCharactersScreenState();
}

class _SimpleCharactersScreenState extends State<SimpleCharactersScreen> {
  @override
  void initState() {
    super.initState();
    // first fetch
    _fetchData();
  }

  void _fetchData() => context.read<CharactersCubit>().getCharactersById(
    ids: widget.simpleCategoryModel.characters,
  );
  @override
  Widget build(BuildContext context) {
    return NetworkBlocListener(
      whenConnected: _fetchData,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${widget.simpleCategoryModel.name}\'s Members',
            style: AppTextStyles.font14MainOrangeSemiBold,
          ),
        ),
        body: widget.simpleCategoryModel.characters.isNullOrEmpty
            ? Center(
                child: Text(
                  'No members found in ${widget.simpleCategoryModel.name}',
                  style: AppTextStyles.font16WhiteBrownMedium,
                ),
              )
            : const SimpleCharactersGridView(),
      ),
    );
  }
}
