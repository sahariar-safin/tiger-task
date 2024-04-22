
class UserModel {
  final String login;
  final int id;
  final String avatar_url;

  UserModel({
    required this.login,
    required this.id,
    required this.avatar_url,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      login: json['login']  ?? '',
      id: json['id'] ?? 0,
      avatar_url: json['avatar_url'] ?? '',
    );
  }
}