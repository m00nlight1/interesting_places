import 'package:dio/dio.dart';
import 'package:interesting_places/api/service/api_client.dart';
import 'package:interesting_places/features/common/data/repositories/favorites_repository.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class AppDependencies {
  static List<SingleChildWidget> providers() {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = 'http://109.73.206.134:8888/api/'
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    final apiClient = ApiClient(dio);
    return [
      Provider<ApiClient>(create: (_) => apiClient),
      Provider<IFavoritesRepository>(create: (_) => FavoritesRepository()),
    ];
  }
}
