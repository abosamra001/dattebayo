import '../../../../core/helpers/constants.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/character_response_model.dart';

class CharactersRepo {
  final ApiService apiService;

  CharactersRepo({required this.apiService});

  Future<ApiResult<CharacterResponseModel>> getAllCharacters({
    int? limit,
    int? page,
  }) =>
      _serviceCall(() => apiService.getAllCharacters(limit: limit, page: page));

  Future<ApiResult<List<CharacterModel>>> getCharacterById({
    required String ids,
  }) => _serviceCall(() => apiService.getCharactersById(charactersIds: ids));

  Future<ApiResult<CharacterResponseModel>> getDetailedCategory({
    required DetailedCategoryType type,
    int? limit,
    int? page,
  }) async {
    try {
      final res = await switch (type) {
        DetailedCategoryType.akatsuki => apiService.getakAtsuki(
          limit: limit,
          page: page,
        ),
        DetailedCategoryType.tailedBeasts => apiService.getTailedBeasts(
          limit: limit,
          page: page,
        ),
        DetailedCategoryType.kara => apiService.getKara(
          limit: limit,
          page: page,
        ),
      };
      return ApiResult.success(res);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CharacterResponseModel>> searchCharactersByName({
    String? name,
    int? limit,
    int? page,
  }) => _serviceCall(
    () =>
        apiService.searchCharactersByName(name: name, limit: limit, page: page),
  );

  Future<ApiResult<T>> _serviceCall<T>(Future<T> Function() call) async {
    try {
      return ApiResult.success(await call());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
