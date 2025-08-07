class UserModel {
  final String userName;
  final String email;
  final String phoneNumber;
  final String token;
  final String userId;
  final String role;

  UserModel({
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.token,
    required this.userId,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      token: json['token'] ?? '',
      userId: json['userId'] ?? '',
      role: json['role'] ?? '',
    );
  }
}
