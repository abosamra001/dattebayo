import '../../../../core/helpers/constants.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/simple_category_model.dart';

class SimpleCategoryRepo {
  final ApiService apiService;

  const SimpleCategoryRepo({required this.apiService});

  Future<ApiResult<SimpleCategoryModelResponse>> getSimpleCategory({
    required SimpleCategoryType categoryType,
    int? limit,
    int? page,
  }) async {
    try {
      final res = await switch (categoryType) {
        SimpleCategoryType.clans => apiService.getAllClans(
          limit: limit,
          page: page,
        ),
        SimpleCategoryType.villages => apiService.getAllVillages(
          limit: limit,
          page: page,
        ),
        SimpleCategoryType.teams => apiService.getAllTeams(
          limit: limit,
          page: page,
        ),
        SimpleCategoryType.kekkeiGenkai => apiService.getAllKekkeiGenkai(
          limit: limit,
          page: page,
        ),
      };
      return ApiResult.success(res);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
