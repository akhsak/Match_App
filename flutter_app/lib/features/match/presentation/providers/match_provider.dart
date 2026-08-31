import 'package:flutter/material.dart';
import 'package:flutter_app/features/match/data/providers/match_provider.dart';
import 'package:flutter_app/features/match/presentation/providers/match_provider.dart';


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

    return provider.checkMatch(
      boyName: boyName,
      girlName: girlName,
    );
  }
}