import 'package:flutter/material.dart';
import 'package:flutter_app/app/routes/app_routes.dart';
import 'package:flutter_app/app/routes/route_generator.dart';
import 'package:flutter_app/core/network/api_client.dart';
import 'package:flutter_app/core/storage/token_storage.dart';
import 'package:flutter_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_app/features/auth/presentation/controller/auth_providers.dart';
import 'package:flutter_app/features/auth/presentation/services/auth_api_services.dart';
import 'package:flutter_app/features/match/data/controller/match_provider.dart';
import 'package:flutter_app/features/match/data/services/match_api_services.dart';
import 'package:flutter_app/features/match/presentation/pages/match_input_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenStorage = TokenStorage();
    final apiClient = ApiClient(tokenStorage: tokenStorage);
    final authApiService = AuthApiService(apiClient);
    final matchApiService = MatchApiService(apiClient);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(authApiService, tokenStorage),
        ),
        ChangeNotifierProvider(create: (_) => MatchProvider(matchApiService)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthGate(),
        initialRoute: AppRoutes.login,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _checkAuthOnStart();
  }

  Future<void> _checkAuthOnStart() async {
    final authProvider = context.read<AuthProvider>();
    await authProvider.checkAuthentication();

    if (!mounted) return;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (authProvider.isAuthenticated) {
      return const MatchInputScreen();
    }

    return const LoginScreen();
  }
}
