import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiger_task/features/repositories/controllers.repositories/repositories_controller.dart';
import 'package:tiger_task/features/repositories/cubit/repository_cubit_state.dart';
import 'package:tiger_task/features/repositories/models/allrepo_model.dart';
import 'package:tiger_task/features/repositories/models/user_model.dart';

class RepositoryCubit extends Cubit<RepositoryCubitState> {
  List<RepositoriesModel> repository = [];
  RepositoriesController controller;
  RepositoryCubit({required this.controller}) : super(RepositoryCubitInitial());


  void getRepository (String owner, String repo) async {
    try {
      emit(RepositoryCubitLoading());
      repository = await controller.fetchRepository(owner, repo);
      emit(RepositoryCubitLoaded(repository: repository));
    } catch (e) {
      emit(RepositoryCubitError(message: e.toString()));
    }
  }
}