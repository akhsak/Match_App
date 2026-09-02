class ApiConstants {
  static const String baseUrl =
      // Android emulator: http://10.0.2.2:8000/api/v1/auth
      // Physical device: http://<your-lan-ip>:8000/api/v1/auth
      // Chrome/web: http://localhost:8000/api/v1/auth
      //'http://localhost:8000/api/v1/auth';
      'https://machine-task-ze3j.onrender.com/api/v1/auth';

  static const String login = '/login';
  static const String signup = '/signup';
  static const String checkMatch = '/check-match';
  static const String refreshToken = '/token/refresh';
}
