import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/simple_category_model.dart';

part 'simple_category_state.freezed.dart';

@freezed
class SimpleCategoryState with _$SimpleCategoryState {
  const factory SimpleCategoryState.initial() = _Initial;
  const factory SimpleCategoryState.simpleLoading() = SimpleLoading;
  const factory SimpleCategoryState.simpleSuccess({
    required List<SimpleCategoryModel> data,
    required bool isLoadingMore,
  }) = SimpleSuccess;
  const factory SimpleCategoryState.simpleError(String error) = SimpleError;
}
