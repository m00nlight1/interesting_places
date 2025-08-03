import 'package:dio/dio.dart' hide Headers;
import 'package:interesting_places/api/data/place_dto.dart';
import 'package:interesting_places/api/data/search_dto.dart';
import 'package:interesting_places/api/service/api_urls.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(ApiUrls.places)
  Future<List<PlaceDto>> getPlaces();

  @GET(ApiUrls.searchPlaces)
  Future<SearchDto> searchPlaces({
    @Query('q') required String query,
    @Query('limit') int limit = 10,
    @Query('offset') int offset = 0,
  });
}
