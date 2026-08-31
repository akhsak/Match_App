import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../models/auth_response_model.dart';

class AuthApiService {
  final ApiClient _apiClient;

  AuthApiService(this._apiClient);

  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.post(
      ApiConstants.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    return AuthResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  Future<AuthResponseModel> signup({
    required String email,
    required String password,
    required String fullName,
  }) async {
    final response = await _apiClient.post(
      ApiConstants.signup,
      data: {
        'email': email,
        'password': password,
        'full_name': fullName,
      },
    );

    return AuthResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}