import 'package:interesting_places/api/data/place_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_dto.g.dart';

@JsonSerializable(createToJson: false)
class SearchDto {
  final String query;
  final int total;
  final List<SearchResultDto> results;

  const SearchDto({
    required this.query,
    required this.total,
    required this.results,
  });

  List<PlaceDto> get places => results.map((e) => e.place).toList();

  factory SearchDto.fromJson(Map<String, dynamic> json) =>
      _$SearchDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class SearchResultDto {
  final PlaceDto place;

  @JsonKey(name: 'relevance_score')
  final double relevanceScore;

  const SearchResultDto({required this.place, required this.relevanceScore});

  factory SearchResultDto.fromJson(Map<String, dynamic> json) =>
      _$SearchResultDtoFromJson(json);
}
