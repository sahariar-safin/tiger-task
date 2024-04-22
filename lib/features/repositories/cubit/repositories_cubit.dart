import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiger_task/features/repositories/cubit/repositories_cubit_state.dart';
import 'package:tiger_task/features/repositories/controllers.repositories/repositories_controller.dart';
import 'package:tiger_task/features/repositories/models/allrepo_model.dart';

class RepositoriesCubit extends Cubit<RepositoriesCubitState> {
  List<RepositoriesModel> repositories = [];
  RepositoriesController controller;
  RepositoriesCubit({required this.controller}) : super(RepositoriesCubitInitial());

  void getAllRepositories(pageNumber) async {
    try {
      emit(RepositoriesCubitLoading());

      repositories = await controller.fetchRepositories(pageNumber);
      emit(RepositoriesCubitLoaded(repositories: repositories));
    } catch (e) {
      emit(RepositoriesCubitError(message: e.toString()));
    }
  }
}