import 'package:equatable/equatable.dart';
import 'package:tiger_task/features/repositories/models/allrepo_model.dart';

abstract class RepositoriesCubitState extends Equatable {
  const RepositoriesCubitState();
}

class RepositoriesCubitInitial extends RepositoriesCubitState {

  @override
  List<Object?> get props => [];
}

class RepositoriesCubitLoading extends RepositoriesCubitState {

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class RepositoriesCubitLoaded extends RepositoriesCubitState {
  List<RepositoriesModel> repositories;
  

  RepositoriesCubitLoaded({required this.repositories});

  @override
  List<Object?> get props => [repositories];
}

class RepositoriesCubitError extends RepositoriesCubitState {
  String message;

  RepositoriesCubitError({required this.message});

  @override
  List<Object?> get props => [message];
}

class RepositoryDetailsCubitState extends Equatable {
  const RepositoryDetailsCubitState();

  @override
  List<Object?> get props => [];
}

class RepositoryDetailsCubitInitial extends RepositoryDetailsCubitState {}

class RepositoryDetailsCubitLoading extends RepositoryDetailsCubitState {}

class RepositoryDetailsCubitLoaded extends RepositoryDetailsCubitState {
  final RepositoriesModel repository;

  RepositoryDetailsCubitLoaded({required this.repository});

  @override
  List<Object?> get props => [repository];
}