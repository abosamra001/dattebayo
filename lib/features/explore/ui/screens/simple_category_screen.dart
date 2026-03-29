import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/widgets/global_error_widget.dart';
import '../../../../core/widgets/uzumaki_loading_indicator.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/themes/colors.dart';
import '../../logic/cubit/simple_category_state.dart';
import '../../logic/cubit/simple_category_cubit.dart';
import '../widgets/simple_category_card.dart';

class SimpleCategoryScreen extends StatefulWidget {
  final SimpleCategoryType simpleCategoryType;
  const SimpleCategoryScreen({super.key, required this.simpleCategoryType});

  @override
  State<SimpleCategoryScreen> createState() => _SimpleCategoryScreenState();
}

class _SimpleCategoryScreenState extends State<SimpleCategoryScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<Color> colors = const [
    ColorManager.mainColor,
    Colors.red,
    Colors.deepPurple,
  ];

  @override
  void initState() {
    super.initState();
    getSimpleCategory();
    _scrollController.addListener(_addPagination);
  }

  void _addPagination() {
    final position = _scrollController.position.pixels;
    final isAtBottom =
        position >= _scrollController.position.maxScrollExtent - 200;
    if (isAtBottom) {
      getSimpleCategory();
    }
  }

  void getSimpleCategory() {
    context.read<SimpleCategoryCubit>().getSimpleCategory(
      categoryType: widget.simpleCategoryType,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final type = widget.simpleCategoryType.name;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: Container(
            margin: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: ColorManager.lightBrown,
              shape: BoxShape.circle,
            ),
            child: const BackButton(color: ColorManager.mainColor),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              verticalSpace(46),
              Text(
                'Explore ${type.capitalizeFirst()}',
                style: AppTextStyles.font40MainOrangeExtraBold,
              ),
              Text(
                '${type.capitalizeFirst()} is sorted by the number of shibobi it contains by default.',
                style: AppTextStyles.font10BlueGrayBold,
              ),
              verticalSpace(24),
              Expanded(
                child: BlocBuilder<SimpleCategoryCubit, SimpleCategoryState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      simpleLoading: () =>
                          const Center(child: UzumakiLoadingIndicator()),
                      simpleSuccess: (data, isLoadingMore) {
                        return ListView.builder(
                          controller: _scrollController,
                          padding: .zero,
                          itemCount: data.length + (isLoadingMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (isLoadingMore && data.length == index) {
                              return const Center(
                                child: UzumakiLoadingIndicator(),
                              );
                            }
                            return SimpleCategoryCard(
                              title: data[index].name,
                              subTitle:
                                  'Contains ${data[index].characters.length} Shinobi',
                              color: colors[index % colors.length],
                              index: index,
                            );
                          },
                        );
                      },
                      simpleError: (error) => GlobalErrorWidget(error: error),
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
