import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import '../storage/token_storage.dart';

class ApiClient {
  final Dio dio;
  final TokenStorage tokenStorage;

  ApiClient({
    Dio? dio,
    TokenStorage? tokenStorage,
  })  : dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: ApiConstants.baseUrl,
                connectTimeout: const Duration(seconds: 15),
                receiveTimeout: const Duration(seconds: 15),
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
              ),
            ),
        tokenStorage = tokenStorage ?? TokenStorage();

  Future<Response<dynamic>> post(
    String path, {
    Map<String, dynamic>? data,
    bool requiresAuth = false,
  }) async {
    try {
      final headers = <String, dynamic>{};

      if (requiresAuth) {
        final token = await tokenStorage.getAccessToken();

        if (token != null && token.isNotEmpty) {
          headers['Authorization'] = 'Bearer $token';
        }
      }

      return await dio.post(
        path,
        data: data,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  String _getErrorMessage(DioException error) {
    if (error.response?.data is Map<String, dynamic>) {
      final data = error.response!.data as Map<String, dynamic>;

      if (data['detail'] != null) {
        return data['detail'].toString();
      }

      if (data['message'] != null) {
        return data['message'].toString();
      }
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timed out. Please try again.';

      case DioExceptionType.connectionError:
        return 'Unable to connect to the server.';

      default:
        return 'Something went wrong. Please try again.';
    }
  }
}