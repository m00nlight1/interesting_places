import 'package:interesting_places/api/service/api_client.dart';
import 'package:interesting_places/core/data/repositories/base_repository.dart';
import 'package:interesting_places/core/domain/entities/result/request_operation.dart';
import 'package:interesting_places/features/common/data/converters/place_converter.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/search/domain/repositories/i_search_repository.dart';

final class SearchRepository extends BaseRepository
    implements ISearchRepository {
  final ApiClient _apiClient;
  final IPlaceDtoToEntityConverter _placeDtoToEntityConverter;

  SearchRepository({
    required ApiClient apiClient,
    required IPlaceDtoToEntityConverter placeDtoToEntityConverter,
  }) : _apiClient = apiClient,
       _placeDtoToEntityConverter = placeDtoToEntityConverter;

  @override
  RequestOperation<List<PlaceEntity>> searchPlaces({required String query}) {
    return makeApiCall<List<PlaceEntity>>(() async {
      final resultDTO = await _apiClient.searchPlaces(query: query);
      final placesEntities =
          _placeDtoToEntityConverter.convertMultiple(resultDTO.places).toList();
      return placesEntities;
    });
  }
}
