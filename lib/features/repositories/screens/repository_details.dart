import 'package:flutter/material.dart';

class RepositoryDetails extends StatelessWidget {
  const RepositoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repository Details'),
      ),
      body: const Center(
        child: Text('Repository Details'),
      ),
    );
  }
}