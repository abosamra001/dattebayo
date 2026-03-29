import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_category_model.g.dart';

Object? _extractData(Map json, String _) {
  return json['clans'] ??
      json['villages'] ??
      json['kekkei-genkai'] ??
      json['teams'] ??
      [];
}

@JsonSerializable()
class SimpleCategoryModelResponse {
  @JsonKey(readValue: _extractData)
  final List<SimpleCategoryModel> data;
  final int currentPage;
  final int pageSize;
  final int total;

  SimpleCategoryModelResponse({
    required this.data,
    required this.currentPage,
    required this.pageSize,
    required this.total,
  });

  factory SimpleCategoryModelResponse.fromJson(Map<String, dynamic> json) =>
      _$SimpleCategoryModelResponseFromJson(json);
}

@JsonSerializable()
class SimpleCategoryModel {
  final int id;
  final String name;
  final List<int> characters;

  const SimpleCategoryModel({
    required this.id,
    required this.name,
    required this.characters,
  });

  factory SimpleCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SimpleCategoryModelFromJson(json);
}
