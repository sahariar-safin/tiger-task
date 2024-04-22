import 'package:flutter/material.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard({Key? key, required this.repositoryName, required this.repositoryDescription}) : super(key: key);

  final String repositoryName;
  final String repositoryDescription;

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
      child: Column(
            children: [
              Text(
                repositoryName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(repositoryDescription),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/repository-details');
                },
                child: const Text('View Details'),
              ),
            ],
          ),
    );
  }
}