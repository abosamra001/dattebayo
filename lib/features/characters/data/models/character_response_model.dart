import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/helpers/map_converter.dart';
import '../../../../core/helpers/string_or_list_converter.dart';

part 'character_response_model.g.dart';

@JsonSerializable()
class CharacterResponseModel {
  final List<CharacterModel> characters;
  final int currentPage;
  final int pageSize;
  final int total;

  CharacterResponseModel({
    required this.characters,
    required this.currentPage,
    required this.pageSize,
    required this.total,
  });

  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseModelFromJson(json);
}

@JsonSerializable()
class CharacterModel {
  final int id;
  final String? name;
  final List<String>? images;
  final Map<String, String>? family;
  @PersonalDetailsConverter()
  final CharacterPersonalDetails? personal;

  CharacterModel({
    required this.id,
    required this.name,
    required this.images,
    required this.family,
    required this.personal,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
}

@JsonSerializable()
class CharacterPersonalDetails {
  final String? birthdate;
  final String? sex;
  @JsonKey(name: 'kekkeiMōra')
  @StringOrListConverter()
  final List<String>? kekkeiMora;
  @StringOrListConverter()
  final List<String>? kekkeiGenkai;
  @StringOrListConverter()
  final List<String>? occupation;
  @StringOrListConverter()
  final List<String>? titles;
  @StringOrListConverter()
  final List<String>? team;
  @StringOrListConverter()
  final List<String>? clan;
  @StringOrListConverter()
  final List<String>? uniqueTraits;
  @StringOrListConverter()
  final List<String>? affiliation;
  final Map<String, String>? age;
  final Map<String, String>? height;
  final Map<String, String>? weight;

  CharacterPersonalDetails({
    required this.birthdate,
    required this.sex,
    required this.clan,
    required this.kekkeiMora,
    required this.kekkeiGenkai,
    required this.occupation,
    required this.titles,
    required this.team,
    required this.uniqueTraits,
    required this.affiliation,
    required this.age,
    required this.height,
    required this.weight,
  });

  factory CharacterPersonalDetails.fromJson(Map<String, dynamic> json) =>
      _$CharacterPersonalDetailsFromJson(json);
}
