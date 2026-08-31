import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/network/api_client.dart';
import '../core/storage/token_storage.dart';
import '../features/match/data/providers/auth_providers.dart';
import '../features/match/data/providers/match_provider.dart';
import '../features/match/data/services/auth_api_services.dart';
import '../features/match/data/services/match_api_services.dart';
import 'routes/app_routes.dart';
import 'routes/route_generator.dart';

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
        initialRoute: AppRoutes.login,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
