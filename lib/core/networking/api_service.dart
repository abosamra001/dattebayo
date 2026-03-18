import 'package:dattebayo/core/networking/api_constants.dart';
import 'package:dattebayo/features/characters/data/models/character_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET(ApiConstants.allCharacters)
  Future<CharacterResponseModel> getAllCharacters({
    @Query('limit') int? limit,
    @Query('page') int? page,
  });
}
