class MatchResult {
  const MatchResult({
    required this.girlName,
    required this.boyName,
    required this.isMatch,
    required this.message,
    required this.verdict,
    required this.heartCount,
  });

  final String girlName;
  final String boyName;
  final bool isMatch;
  final String message;
  final String verdict;
  final int heartCount;

  String get displayGirlName => girlName.trim();
  String get displayBoyName => boyName.trim();
  String get headline => '$displayGirlName and $displayBoyName ${verdict.trim()}';
}
