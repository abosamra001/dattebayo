import 'package:dattebayo/core/networking/api_constants.dart';
import 'package:dattebayo/features/characters/data/models/character_response_model.dart';
import 'package:dattebayo/features/explore/data/models/simple_category_model.dart';
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

  @GET(ApiConstants.charactersById)
  Future<List<CharacterModel>> getCharactersById({
    @Path('id') String? charactersIds,
  });

  @GET(ApiConstants.allCharacters)
  Future<CharacterResponseModel> searchCharactersByName({
    @Query('name') String? name,
    @Query('limit') int? limit,
    @Query('page') int? page,
  });

  // simple category
  @GET(ApiConstants.allClans)
  Future<SimpleCategoryModelResponse> getAllClans({
    @Query('limit') int? limit,
    @Query('page') int? page,
  });

  @GET(ApiConstants.allVillages)
  Future<SimpleCategoryModelResponse> getAllVillages({
    @Query('limit') int? limit,
    @Query('page') int? page,
  });

  @GET(ApiConstants.allTeams)
  Future<SimpleCategoryModelResponse> getAllTeams({
    @Query('limit') int? limit,
    @Query('page') int? page,
  });

  @GET(ApiConstants.allKekkeiGenkai)
  Future<SimpleCategoryModelResponse> getAllKekkeiGenkai({
    @Query('limit') int? limit,
    @Query('page') int? page,
  });

  @GET(ApiConstants.akatsuki)
  Future<CharacterResponseModel> getakAtsuki({
    @Query('limit') int? limit,
    @Query('page') int? page,
  });

  @GET(ApiConstants.tailedBeasts)
  Future<CharacterResponseModel> getTailedBeasts({
    @Query('limit') int? limit,
    @Query('page') int? page,
  });

  @GET(ApiConstants.kara)
  Future<CharacterResponseModel> getKara({
    @Query('limit') int? limit,
    @Query('page') int? page,
  });
}
