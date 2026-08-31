import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
import '../../features/match/domain/entities/match_result.dart';
import '../../features/match/presentation/pages/match_input_screen.dart';
import '../../features/match/presentation/pages/match_result_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
      case AppRoutes.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
      case AppRoutes.signup:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignUpScreen(),
        );
      case AppRoutes.matchInput:
      case AppRoutes.match:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MatchInputScreen(),
        );
      case AppRoutes.result:
      case AppRoutes.matchResult:
        final result = settings.arguments;
        if (result is MatchResult) {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => MatchResultScreen(),
          );
        }
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
    }
  }
}
