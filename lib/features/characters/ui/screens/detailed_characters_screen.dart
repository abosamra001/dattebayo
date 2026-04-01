import 'package:dattebayo/features/characters/ui/widgets/detailed_category_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widgets/network_bloc_listener.dart';
import '../../logic/characters_cubit.dart';

class DetailedCharactersScreen extends StatefulWidget {
  final DetailedCategoryType type;
  const DetailedCharactersScreen({super.key, required this.type});

  @override
  State<DetailedCharactersScreen> createState() =>
      _DetailedCharactersScreenState();
}

class _DetailedCharactersScreenState extends State<DetailedCharactersScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CharactersCubit>().getDetailedCategory(type: widget.type);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NetworkBlocListener(
      whenConnected: () {},
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.type.name.capitalizeFirst().toString(),
            style: AppTextStyles.font20MainOrangeBold,
          ),
          centerTitle: true,
          scrolledUnderElevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              verticalSpace(16),
              const Expanded(child: DetailedCategoryGridView()),
            ],
          ),
        ),
      ),
    );
  }
}
