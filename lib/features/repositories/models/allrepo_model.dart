

class RepositoriesModel {
  final String name;
  final String description;
  final String language;
  final int stars;
  final int forks;
  final String owner;
  final String avatar;

  RepositoriesModel({
    required this.name,
    required this.description,
    required this.language,
    required this.stars,
    required this.forks,
    required this.owner,
    required this.avatar,
  });

  factory RepositoriesModel.fromJson(Map<String, dynamic> json) {
    return RepositoriesModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      language: json['language'] ?? '',
      stars: json['stargazers_count'] ?? 0,
      forks: json['forks_count'] ?? 0,
      owner: json['owner']['login'] ?? '',
      avatar: json['owner']['avatar_url'] ?? '',
    );
  }
}