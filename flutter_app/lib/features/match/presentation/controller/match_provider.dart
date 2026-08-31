import 'package:flutter_app/features/match/data/controller/match_provider.dart';

class MatchController {
  final MatchProvider provider;

  MatchController(this.provider);

  Future<bool> submitMatch({
    required String boyName,
    required String girlName,
  }) async {
    if (boyName.trim().isEmpty || girlName.trim().isEmpty) {
      return false;
    }

    return provider.checkMatch(boyName: boyName, girlName: girlName);
  }
}
