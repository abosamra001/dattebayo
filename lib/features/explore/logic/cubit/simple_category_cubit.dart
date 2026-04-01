import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/simple_category_model.dart';
import '../../data/repos/simple_category_repo.dart';
import 'simple_category_state.dart';

class SimpleCategoryCubit extends Cubit<SimpleCategoryState> {
  final SimpleCategoryRepo repo;

  SimpleCategoryCubit({required this.repo})
    : super(const SimpleCategoryState.initial());

  void getSimpleCategory({required SimpleCategoryType categoryType}) async {
    emit(const SimpleCategoryState.simpleLoading());
    final res = await repo.getSimpleCategory(
      categoryType: categoryType,
      limit: 200,
      page: 1,
    );

    res.when(
      success: (model) {
        final allData = List<SimpleCategoryModel>.from(model.data);
        allData.sort(
          (a, b) => b.characters.length.compareTo(a.characters.length),
        );
        emit(SimpleCategoryState.simpleSuccess(data: allData));
      },
      failure: (error) => emit(SimpleCategoryState.simpleError(error)),
    );
  }
}
