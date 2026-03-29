import 'package:dattebayo/core/networking/api_service.dart';
import 'package:dattebayo/core/networking/dio_factory.dart';
import 'package:dattebayo/features/characters/data/repos/characters_repo.dart';
import 'package:dattebayo/features/characters/logic/characters_cubit.dart';
import 'package:dattebayo/features/explore/data/repos/simple_category_repo.dart';
import 'package:dattebayo/features/explore/logic/cubit/simple_category_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // characters
  getIt.registerLazySingleton<CharactersRepo>(
    () => CharactersRepo(apiService: getIt()),
  );
  getIt.registerFactory<CharactersCubit>(() => CharactersCubit(repo: getIt()));

  // simple category
  getIt.registerLazySingleton<SimpleCategoryRepo>(
    () => SimpleCategoryRepo(apiService: getIt()),
  );
  getIt.registerFactory<SimpleCategoryCubit>(
    () => SimpleCategoryCubit(repo: getIt()),
  );
}
