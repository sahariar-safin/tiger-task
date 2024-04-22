import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiger_task/features/repositories/cubit/repositories_cubit.dart';
import 'package:tiger_task/features/repositories/cubit/repositories_cubit_state.dart';
import 'package:tiger_task/features/repositories/models/allrepo_model.dart';

class AllRepositories extends StatefulWidget {
  const AllRepositories({super.key});


  @override
  State<AllRepositories> createState() => _AllRepositoriesState();
}

class _AllRepositoriesState extends State<AllRepositories> {
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RepositoriesCubit>().getAllRepositories(1);
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
              itemCount: state.repositories.length,
              itemBuilder: (context, index) {
                RepositoriesModel repository = state.repositories[index];
                return ListTile(
                  title: Text(
                    repository.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    repository.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => Navigator.pushNamed(context, '/repository-details', arguments: repository),
                  
                );
                // return RepositoryCard(
                //   repositoryName: state.repositories[index].name,
                //   repositoryDescription: state.repositories[index].description,
                // );
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


 // body: BlocBuilder<RepositoriesController, List<dynamic>>(
      //   builder: (context, state) {
      //     print(state);
      //     return ListView.builder(
      //       itemCount: state.length,
      //       itemBuilder: (context, index) {
      //         return RepositoryCard(
      //           repositoryName: state[index].name,
      //           repositoryDescription: state[index].description,
      //         );
      //       },
      //     );
      //   },
      // ),