import 'package:dio/dio.dart';
import 'package:store/constants/strings.dart';

class EpisodeService {
late   Dio dio;

  EpisodeService() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: 1000 * 20,
        connectTimeout: 1000 * 20,
        receiveDataWhenStatusError: true);
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllEpisodes() async {
    try {
      Response response = await dio.get('episodes');
      return response.data;
    } catch (e) {
      return [];
    }
  }
}
