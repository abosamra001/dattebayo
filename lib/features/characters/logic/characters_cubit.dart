import 'package:dattebayo/core/helpers/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/networking/api_result.dart';
import '../data/models/character_response_model.dart';
import '../data/repos/characters_repo.dart';
import 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo repo;
  CharactersCubit({required this.repo}) : super(CharactersState.initial());

  final List<CharacterModel> characters = [];
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isFetching = false;

  final List<CharacterModel> _searchedCharacters = [];
  int _currentSearchPage = 1;
  bool _hasMoreSearch = true;
  bool _isSearching = false;
  String? _lastQuery;

  int _index = 0;
  List<int> _cachedIds = [];

  void getAllCharacters({int? limit = 20}) async {
    if (!_hasMore || _isFetching) return;
    _isFetching = true;
    if (_currentPage == 1) {
      emit(CharactersState.charactersLoading());
    } else {
      emit(CharactersState.charactersLoadingMore(characters: characters));
    }
    final res = await repo.getAllCharacters(limit: limit, page: _currentPage);
    res.when(
      success: (model) {
        _currentPage++;
        _hasMore = model.characters.length == limit;
        characters.addAll(model.characters);
        emit(CharactersState.charactersSuccess(characters: characters));
      },
      failure: (error) => emit(CharactersState.charactersError(error)),
    );
    _isFetching = false;
  }

  void getDetailedCategory({
    required DetailedCategoryType type,
    int? limit,
    int? page,
  }) async {
    emit(CharactersState.charactersLoading());
    final res = await repo.getDetailedCategory(type: type, page: 1, limit: 50);
    res.when(
      success: (model) =>
          emit(CharactersState.charactersSuccess(characters: model.characters)),
      failure: (error) => emit(CharactersState.charactersError(error)),
    );
  }

  void getCharactersById({List<int>? ids, int length = 20}) async {
    if (ids != null) {
      _cachedIds = ids;
      _index = 0;
      characters.clear();
      _hasMore = true;
    }
    if (_cachedIds.isNullOrEmpty) return;
    if (!_hasMore || _isFetching) return;

    _isFetching = true;
    if (_index == 0) {
      emit(CharactersState.charactersLoading());
    } else {
      emit(CharactersState.charactersLoadingMore(characters: characters));
    }
    final currentChunck = _getChuck(_cachedIds, length);
    final res = await repo.getCharacterById(ids: currentChunck);
    res.when(
      success: (model) {
        _hasMore = _index < _cachedIds.length;
        characters.addAll(model);
        emit(CharactersState.charactersSuccess(characters: characters));
      },
      failure: (error) => emit(CharactersState.charactersError(error)),
    );
    _isFetching = false;
  }

  String _getChuck(List<int> ids, int length) {
    // trilling , is for making sure the api call fetches the entered
    // ids list not all characters endpoint
    final chunk = ids.skip(_index).take(length).toList();
    _index += chunk.length;
    return '${chunk.join(',')},';
  }

  void searchCharactersByName({String? name, int? limit = 20}) async {
    if (name != null) {
      _lastQuery = name;
      clearSearchList();
    }
    if (_lastQuery.isNullOrEmpty) {
      emit(CharactersState.charactersSuccess(characters: characters));
      return;
    }
    if (!_hasMoreSearch || _isSearching) return;

    _isSearching = true;
    if (_currentSearchPage == 1) {
      emit(CharactersState.charactersLoading());
    } else {
      emit(
        CharactersState.charactersLoadingMore(characters: _searchedCharacters),
      );
    }
    final res = await repo.searchCharactersByName(
      name: _lastQuery,
      limit: limit,
      page: _currentSearchPage,
    );
    res.when(
      success: (responseModel) {
        _currentSearchPage++;
        _hasMoreSearch = responseModel.characters.length == limit;
        _searchedCharacters.addAll(responseModel.characters);
        emit(
          CharactersState.charactersSearchSuccess(
            characters: _searchedCharacters,
          ),
        );
      },
      failure: (error) => emit(CharactersState.charactersError(error)),
    );
    _isSearching = false;
  }

  void clearSearchList() {
    _searchedCharacters.clear();
    _currentSearchPage = 1;
    _hasMoreSearch = true;
    _isSearching = false;
  }
}
