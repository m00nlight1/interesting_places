import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum PlaceTypeDto {
  @JsonValue('restaurant')
  restaurant('restaurant'),
  @JsonValue('cafe')
  cafe('cafe'),
  @JsonValue('park')
  park('park'),
  @JsonValue('museum')
  museum('museum'),
  @JsonValue('monument')
  monument('monument'),
  @JsonValue('theatre')
  theatre('theatre'),
  @JsonValue('temple')
  temple('temple'),
  @JsonValue('hotel')
  hotel('hotel'),
  @JsonValue('shopping')
  shopping('shopping'),
  @JsonValue('other')
  other('other');

  const PlaceTypeDto(this.json);

  factory PlaceTypeDto.fromJson(String json) =>
      values.firstWhere((value) => value.json == json, orElse: () => other);

  final String? json;

  String? toJson() => json;
}
