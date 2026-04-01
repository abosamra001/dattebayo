import 'package:dattebayo/features/characters/data/models/character_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'characters_state.freezed.dart';

@freezed
class CharactersState with _$CharactersState {
  factory CharactersState.initial() = _Initial;
  factory CharactersState.charactersLoading() = CharactersLoading;
  factory CharactersState.charactersLoadingMore({
    required List<CharacterModel> characters,
  }) = _CharactersLoadingMore;
  factory CharactersState.charactersSuccess({
    required List<CharacterModel> characters,
  }) = CharactersSuccess;
  factory CharactersState.charactersError(String error) = CharactersError;

  // searching
  factory CharactersState.charactersSearchSuccess({
    required List<CharacterModel> characters,
  }) = CharactersSearchSuccess;
}
