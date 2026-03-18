import 'package:dattebayo/core/networking/api_result.dart';
import 'package:dattebayo/core/networking/api_service.dart';
import 'package:dattebayo/features/characters/data/models/character_response_model.dart';

class CharactersRepo {
  final ApiService apiService;

  CharactersRepo({required this.apiService});

  Future<ApiResult<CharacterResponseModel>> getAllCharacters({
    int? limit,
    int? page,
  }) async {
    try {
      final res = await apiService.getAllCharacters(limit: limit, page: page);
      return ApiResult.success(res);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
