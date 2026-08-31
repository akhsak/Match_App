import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../models/match_result_model.dart';

class MatchApiService {
  final ApiClient _apiClient;

  MatchApiService(this._apiClient);

  Future<MatchResultModel> checkMatch({
    required String boyName,
    required String girlName,
  }) async {
    final response = await _apiClient.post(
      ApiConstants.checkMatch,
      requiresAuth: true,
      data: {
        'boy_name': boyName,
        'girl_name': girlName,
      },
    );

    return MatchResultModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}