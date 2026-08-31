class MatchResultModel {
  final int id;
  final String boyName;
  final String girlName;
  final bool isMatch;
  final String message;
  final DateTime? checkedAt;

  const MatchResultModel({
    required this.id,
    required this.boyName,
    required this.girlName,
    required this.isMatch,
    required this.message,
    this.checkedAt,
  });

  factory MatchResultModel.fromJson(Map<String, dynamic> json) {
    return MatchResultModel(
      id: json['id'] as int,
      boyName: json['boy_name'] as String? ?? '',
      girlName: json['girl_name'] as String? ?? '',
      isMatch: json['is_match'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      checkedAt: json['checked_at'] != null
          ? DateTime.tryParse(json['checked_at'].toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'boy_name': boyName,
      'girl_name': girlName,
      'is_match': isMatch,
      'message': message,
      'checked_at': checkedAt?.toIso8601String(),
    };
  }
}