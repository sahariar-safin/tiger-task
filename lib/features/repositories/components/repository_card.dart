import 'package:flutter/material.dart';
import 'package:tiger_task/features/repositories/models/allrepo_model.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard({Key? key, required this.repository}) : super(key: key);

  final RepositoriesModel repository;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: ListTile(
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
                    isThreeLine: true,
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Stars: ${repository.stars}'),
                        Text('Forks: ${repository.forks}'),
                      ],
                    ),
                    onTap: () => Navigator.pushNamed(context, '/repository-details', arguments: repository),
                  )
    );
  }
}