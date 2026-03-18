import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/characters/data/models/character_response_model.dart';

class PersonalDetailsConverter
    implements JsonConverter<CharacterPersonalDetails?, dynamic> {
  const PersonalDetailsConverter();

  @override
  CharacterPersonalDetails? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is List) return null; // ✅ ["Naruto: Shinobi Collection2014"]
    if (json is Map<String, dynamic>) {
      return CharacterPersonalDetails.fromJson(json); // ✅ الـ Map العادي
    }
    return null;
  }

  @override
  dynamic toJson(CharacterPersonalDetails? object) => object;
}
