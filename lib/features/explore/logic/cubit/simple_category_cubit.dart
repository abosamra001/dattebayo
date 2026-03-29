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

  final List<SimpleCategoryModel> _data = [];
  int _page = 1;
  bool _hasMore = true;
  bool _isFetching = false;

  void getSimpleCategory({
    required SimpleCategoryType categoryType,
    int? limit = 10,
  }) async {
    if (_isFetching || !_hasMore) return;
    _isFetching = true;

    if (_page == 1) {
      emit(const SimpleCategoryState.simpleLoading());
    } else {
      emit(SimpleCategoryState.simpleSuccess(data: _data, isLoadingMore: true));
    }

    final res = await repo.getSimpleCategory(
      categoryType: categoryType,
      limit: limit,
      page: _page,
    );

    res.when(
      success: (response) {
        _page++;
        _hasMore = response.data.length == limit;
        _data.addAll(response.data);
        emit(
          SimpleCategoryState.simpleSuccess(data: _data, isLoadingMore: false),
        );
      },
      failure: (error) => emit(SimpleCategoryState.simpleError(error)),
    );
    _isFetching = false;
  }
}
