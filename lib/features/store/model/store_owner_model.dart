class StoreOwnerModel {
  final String id;
  final String username;
  final String fullName;
  final String? avatarUrl;
  final String? phoneNumber;
  final String role;

  StoreOwnerModel({
    required this.id,
    required this.username,
    required this.fullName,
    this.avatarUrl,
    this.phoneNumber,
    required this.role,
  });

  factory StoreOwnerModel.fromJson(Map<String, dynamic> json) {
    return StoreOwnerModel(
      id: json['id'] as String,
      username: json['username'] as String,
      fullName: json['full_name'] as String,
      avatarUrl: json['avatar_url'] as String?,
      phoneNumber: json['phone_number'] as String?,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'full_name': fullName,
      'avatar_url': avatarUrl,
      'phone_number': phoneNumber,
      'role': role,
    };
  }
}
