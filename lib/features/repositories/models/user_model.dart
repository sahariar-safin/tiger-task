

class UserModel {
  final String login;
  final String id;
  final String avatar_url;

  UserModel({
    required this.login,
    required this.id,
    required this.avatar_url,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      login: json['login'],
      id: json['id'],
      avatar_url: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'login': login,
      'avatar_url': avatar_url,
    };
  }
}