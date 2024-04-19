import 'package:arena_club/common/utils/constants.dart';
import 'package:dio/dio.dart';

class DioSettings {
  late final Dio _dio;

  DioSettings() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    options.headers['Accept'] = 'application/json';
    options.queryParameters['key'] = AppConstants.apiKey;
    _dio = Dio(options);
  }

  Dio get dioClient => _dio;
}
