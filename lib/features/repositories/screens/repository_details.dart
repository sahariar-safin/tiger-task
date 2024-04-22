import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiger_task/features/repositories/cubit/repository_cubit.dart';
import 'package:tiger_task/features/repositories/cubit/repository_cubit_state.dart';
import 'package:tiger_task/features/repositories/models/allrepo_model.dart';
import 'package:tiger_task/utils/formatters/formatter.dart';

class RepositoryDetails extends StatefulWidget {
  const RepositoryDetails({super.key});

  @override
  State<RepositoryDetails> createState() => _RepositoryDetailsState();
}

class _RepositoryDetailsState extends State<RepositoryDetails> {

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as RepositoriesModel;
    final owner = argument.owner.login;
    final repo = argument.name;
  
    context.read<RepositoryCubit>().getRepository(owner, repo);
    return Scaffold(
      appBar: AppBar(
        title: Text('Repository Details'),
      ),
      body: BlocBuilder<RepositoryCubit, RepositoryCubitState>(
        builder: (context, state) {
          if (state is RepositoryCubitLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RepositoryCubitLoaded) {
            final repository = state.repository[0];
            return SingleChildScrollView(
              child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                  children: [
                    Text(
                      repository.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.network(repository.owner.avatar_url, width: 300, height: 300, fit: BoxFit.cover)
                    ),
                    const Text(
                      'Description:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blueGrey
                      )
                    ),
                    Text(
                      repository.description,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Language: ${repository.language}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Stars: ${repository.stars}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Forks: ${repository.forks}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Last Updated: ${TFormatter.formatDate(repository.updated_at)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}