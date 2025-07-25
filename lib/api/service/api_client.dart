import 'package:dio/dio.dart' hide Headers;
import 'package:interesting_places/api/data/place_dto.dart';
import 'package:interesting_places/api/service/api_urls.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(ApiUrls.places)
  Future<List<PlaceDto>> getPlaces();
}
