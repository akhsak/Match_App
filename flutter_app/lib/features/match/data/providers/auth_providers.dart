import 'package:flutter/foundation.dart';
import 'package:flutter_app/features/match/data/services/auth_api_services.dart';

import '../../data/models/auth_response_model.dart';
import '../../../../core/storage/token_storage.dart';

class AuthProvider extends ChangeNotifier {
  final AuthApiService _authApiService;
  final TokenStorage _tokenStorage;

  AuthProvider(
    this._authApiService,
    this._tokenStorage,
  );

  bool _isLoading = false;
  bool _isAuthenticated = false;
  String? _errorMessage;
  AuthResponseModel? _authResponse;

  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;
  String? get errorMessage => _errorMessage;
  AuthResponseModel? get authResponse => _authResponse;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final result = await _authApiService.login(
        email: email,
        password: password,
      );

      await _tokenStorage.saveTokens(
        accessToken: result.accessToken,
        refreshToken: result.refreshToken,
      );

      _authResponse = result;
      _isAuthenticated = true;

      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> signup({
    required String email,
    required String password,
    required String fullName,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final result = await _authApiService.signup(
        email: email,
        password: password,
        fullName: fullName,
      );

      await _tokenStorage.saveTokens(
        accessToken: result.accessToken,
        refreshToken: result.refreshToken,
      );

      _authResponse = result;
      _isAuthenticated = true;

      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    await _tokenStorage.clearTokens();

    _authResponse = null;
    _isAuthenticated = false;

    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
  }
}