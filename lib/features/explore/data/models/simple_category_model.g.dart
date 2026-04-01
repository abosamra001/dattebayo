// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleCategoryModelResponse _$SimpleCategoryModelResponseFromJson(
  Map<String, dynamic> json,
) => SimpleCategoryModelResponse(
  data: (_extractData(json, 'data') as List<dynamic>)
      .map((e) => SimpleCategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  currentPage: (json['currentPage'] as num).toInt(),
  pageSize: (json['pageSize'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$SimpleCategoryModelResponseToJson(
  SimpleCategoryModelResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'currentPage': instance.currentPage,
  'pageSize': instance.pageSize,
  'total': instance.total,
};

SimpleCategoryModel _$SimpleCategoryModelFromJson(Map<String, dynamic> json) =>
    SimpleCategoryModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      characters: (json['characters'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$SimpleCategoryModelToJson(
  SimpleCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'characters': instance.characters,
};
