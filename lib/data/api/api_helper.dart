import 'package:dio/dio.dart';
import 'package:movies_app/main.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_client.dart';

class ApiHelper {
  static ApiClient? client;
  static ApiClient? simpleClient;

  static ApiClient getClient() {
    client ??= _getClient();
    return client!;
  }

  static ApiClient getSimpleClient() {
    simpleClient ??= _getSimpleClient();
    return simpleClient!;
  }

  static ApiClient _getClient() {
    final dio = Dio()
      ..interceptors.addAll([
        // PrettyDioLogger(),
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            const token =
                'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNzU3NjBkZjNjNTAxMmEyZjc2MTdmYmJiMTk5N2U2MSIsInN1YiI6IjYzNDA1ODA4ZDM1ZGVhMDA3ZTA2NzU5NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.B5Ipa77k-OsXCBET8wPXhDqhRbeouESK2c1ZX6YZW1w';
            options.headers['Authorization'] = 'Bearer $token';
            return handler.next(options);
          },

          onError: (error, handler) async {
            print('ERROR ON API HELPER ++++++++++++++++++++++++++++++++++++++++++++++++++++==');
            return handler.next(error);
          },
        ),
        chuck.getDioInterceptor(),
      ]);
    return ApiClient(dio);
  }

  static ApiClient _getSimpleClient() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ApiClient(dio);
  }
}

// 998935366275
// Qwe12345!
