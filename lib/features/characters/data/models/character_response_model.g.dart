// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResponseModel _$CharacterResponseModelFromJson(
  Map<String, dynamic> json,
) => CharacterResponseModel(
  characters: (json['characters'] as List<dynamic>)
      .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  currentPage: (json['currentPage'] as num).toInt(),
  pageSize: (json['pageSize'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$CharacterResponseModelToJson(
  CharacterResponseModel instance,
) => <String, dynamic>{
  'characters': instance.characters,
  'currentPage': instance.currentPage,
  'pageSize': instance.pageSize,
  'total': instance.total,
};

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      family: (json['family'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      personal: const PersonalDetailsConverter().fromJson(json['personal']),
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'images': instance.images,
      'family': instance.family,
      'personal': const PersonalDetailsConverter().toJson(instance.personal),
    };

CharacterPersonalDetails _$CharacterPersonalDetailsFromJson(
  Map<String, dynamic> json,
) => CharacterPersonalDetails(
  birthdate: json['birthdate'] as String?,
  sex: json['sex'] as String?,
  clan: const StringOrListConverter().fromJson(json['clan']),
  kekkeiMora: const StringOrListConverter().fromJson(json['kekkeiMōra']),
  kekkeiGenkai: const StringOrListConverter().fromJson(json['kekkeiGenkai']),
  occupation: const StringOrListConverter().fromJson(json['occupation']),
  titles: const StringOrListConverter().fromJson(json['titles']),
  team: const StringOrListConverter().fromJson(json['team']),
  uniqueTraits: const StringOrListConverter().fromJson(json['uniqueTraits']),
  affiliation: const StringOrListConverter().fromJson(json['affiliation']),
  age: (json['age'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  height: (json['height'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  weight: (json['weight'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
);

Map<String, dynamic> _$CharacterPersonalDetailsToJson(
  CharacterPersonalDetails instance,
) => <String, dynamic>{
  'birthdate': instance.birthdate,
  'sex': instance.sex,
  'kekkeiMōra': const StringOrListConverter().toJson(instance.kekkeiMora),
  'kekkeiGenkai': const StringOrListConverter().toJson(instance.kekkeiGenkai),
  'occupation': const StringOrListConverter().toJson(instance.occupation),
  'titles': const StringOrListConverter().toJson(instance.titles),
  'team': const StringOrListConverter().toJson(instance.team),
  'clan': const StringOrListConverter().toJson(instance.clan),
  'uniqueTraits': const StringOrListConverter().toJson(instance.uniqueTraits),
  'affiliation': const StringOrListConverter().toJson(instance.affiliation),
  'age': instance.age,
  'height': instance.height,
  'weight': instance.weight,
};
