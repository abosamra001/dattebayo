import 'package:freezed_annotation/freezed_annotation.dart';

class StringOrListConverter implements JsonConverter<List<String>?, dynamic> {
  const StringOrListConverter();
  @override
  List<String>? fromJson(json) {
    if (json == null) return null;
    if (json is List) return json.map((e) => e.toString()).toList();
    if (json is String) return [json];

    return null;
  }

  @override
  toJson(List<String>? object) => object;
}
