import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiger_task/features/repositories/cubit/repositories_cubit.dart';
import 'package:tiger_task/features/repositories/controllers.repositories/repositories_controller.dart';
import 'package:tiger_task/features/repositories/cubit/repository_cubit.dart';
import 'package:tiger_task/features/repositories/screens/allrepositories.dart';
import 'package:tiger_task/features/repositories/screens/repository_details.dart';
import 'package:tiger_task/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RepositoriesCubit(controller: RepositoriesController()),
        ),
        BlocProvider(create: (context) => RepositoryCubit(controller: RepositoriesController()))
      ], 
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        home: const AllRepositories(),
        routes: {
          '/all-repositories': (context) => const AllRepositories(),
          '/repository-details': (context) => const RepositoryDetails(),
        }
      )
    );
  }
}