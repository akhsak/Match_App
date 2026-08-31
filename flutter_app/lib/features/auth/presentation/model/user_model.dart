class UserModel {
  final int id;
  final String email;
  final String fullName;
  final String tenantName;
  final DateTime? dateJoined;

  const UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.tenantName,
    this.dateJoined,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      email: json['email'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      tenantName: json['tenant_name'] as String? ?? '',
      dateJoined: json['date_joined'] != null
          ? DateTime.tryParse(json['date_joined'].toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'tenant_name': tenantName,
      'date_joined': dateJoined?.toIso8601String(),
    };
  }
}