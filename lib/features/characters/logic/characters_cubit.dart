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
}
