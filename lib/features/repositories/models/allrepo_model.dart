

import 'package:tiger_task/features/repositories/models/user_model.dart';

class RepositoriesModel {
  final String name;
  final String description;
  final String language;
  final int stars;
  final int forks;
  final UserModel owner;
  final DateTime? updated_at;

  RepositoriesModel({
    required this.name,
    required this.description,
    required this.language,
    required this.stars,
    required this.forks,
    required this.owner,
    this.updated_at,
  });

  factory RepositoriesModel.fromJson(Map<String, dynamic> json) {
    return RepositoriesModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      language: json['language'] ?? '',
      stars: json['stargazers_count'] ?? 0,
      forks: json['forks_count'] ?? 0,
      owner: UserModel.fromJson(json['owner']),
      updated_at: DateTime.parse(json['updated_at']),
    );
  }
}