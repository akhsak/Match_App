import 'package:flutter/foundation.dart';
import 'package:flutter_app/features/match/data/services/match_api_services.dart';

import '../models/match_result_model.dart';

class MatchProvider extends ChangeNotifier {
  final MatchApiService _matchApiService;

  MatchProvider(this._matchApiService);

  bool _isLoading = false;
  String? _errorMessage;
  MatchResultModel? _result;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  MatchResultModel? get result => _result;

  Future<bool> checkMatch({
    required String boyName,
    required String girlName,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _result = null;

    notifyListeners();

    try {
      _result = await _matchApiService.checkMatch(
        boyName: boyName.trim(),
        girlName: girlName.trim(),
      );

      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearResult() {
    _result = null;
    _errorMessage = null;
    notifyListeners();
  }
}
