import 'package:equatable/equatable.dart';
import 'package:tiger_task/features/repositories/models/allrepo_model.dart';

abstract class RepositoryCubitState extends Equatable {
  const RepositoryCubitState();
}

class RepositoryCubitInitial extends RepositoryCubitState {

  @override
  List<Object?> get props => [];
}

class RepositoryCubitLoading extends RepositoryCubitState {

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class RepositoryCubitLoaded extends RepositoryCubitState {
  List<RepositoriesModel> repository;
  

  RepositoryCubitLoaded({required this.repository});

  @override
  List<Object?> get props => [repository];
}

class RepositoryCubitError extends RepositoryCubitState {
  String message;

  RepositoryCubitError({required this.message});

  @override
  List<Object?> get props => [message];
}
