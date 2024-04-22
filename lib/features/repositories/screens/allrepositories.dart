import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiger_task/features/repositories/components/repository_card.dart';
import 'package:tiger_task/features/repositories/cubit/repositories_cubit.dart';
import 'package:tiger_task/features/repositories/cubit/repositories_cubit_state.dart';
import 'package:tiger_task/features/repositories/models/allrepo_model.dart';

class AllRepositories extends StatefulWidget {
  const AllRepositories({super.key});


  @override
  State<AllRepositories> createState() => _AllRepositoriesState();
}

class _AllRepositoriesState extends State<AllRepositories> {
  int pageNumber = 1;
  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RepositoriesCubit>().getAllRepositories(pageNumber);
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      context.read<RepositoriesCubit>().getRepositoriesByScroll(pageNumber + 1);
      pageNumber = pageNumber + 1;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Repositories'),
      ),
      body: BlocBuilder<RepositoriesCubit, RepositoriesCubitState>(
        builder: (context, state) {
          if (state is RepositoriesCubitLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RepositoriesCubitLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(12.0),
              controller: scrollController,
              itemCount: state.repositories.length + 1,
              itemBuilder: (context, index) {
                if (index < state.repositories.length) {
                RepositoriesModel repository = state.repositories[index];
                return RepositoryCard(repository:  repository);
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          } else if (state is RepositoriesCubitError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
