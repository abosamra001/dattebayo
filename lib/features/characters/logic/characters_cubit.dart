import 'package:dattebayo/core/helpers/extensions.dart';
import 'package:dattebayo/core/networking/api_result.dart';
import 'package:dattebayo/features/characters/data/models/character_response_model.dart';
import 'package:dattebayo/features/characters/data/repos/characters_repo.dart';
import 'package:dattebayo/features/characters/logic/characters_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo repo;
  CharactersCubit({required this.repo}) : super(CharactersState.initial());

  final List<CharacterModel> _characters = [];
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isFetching = false;

  final List<CharacterModel> _searchedCharacters = [];
  int _currentSearchPage = 1;
  bool _hasMoreSearch = true;
  bool _isSearching = false;
  String? _lastQuery;

  void getAllCharacters({int? limit = 20}) async {
    if (!_hasMore || _isFetching) return;
    _isFetching = true;
    if (_currentPage == 1) {
      emit(CharactersState.charactersLoading());
    } else {
      emit(CharactersState.charactersLoadingMore(characters: _characters));
    }
    final res = await repo.getAllCharacters(limit: limit, page: _currentPage);
    res.when(
      success: (model) {
        _currentPage++;
        _hasMore = model.characters.length == limit;
        _characters.addAll(model.characters);
        emit(CharactersState.charactersSuccess(characters: _characters));
      },
      failure: (error) => emit(CharactersState.charactersError(error)),
    );
    _isFetching = false;
  }

  void filterByName() async {
    final copy = List.from(_characters).cast<CharacterModel>();
    copy.sort((a, b) => a.name!.compareTo(b.name!));
    emit(CharactersState.charactersSuccess(characters: copy));
  }

  Future<void> searchCharactersByName({String? name, int? limit = 20}) async {
    if (name != null) {
      _lastQuery = name;
      clearSearchList();
    }
    // extension for checking if string is null or empty (after beening trimed)
    if (_lastQuery.isNullOrEmpty) {
      emit(CharactersState.charactersSuccess(characters: _characters));
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
