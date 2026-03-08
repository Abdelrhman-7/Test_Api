import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/controller/business_logic-layer/test_api_cubit.dart';
import 'package:flutter_application_1/models/api_manager/api_manager.dart';
import 'package:flutter_application_1/models/repository/repository.dart';
import 'package:flutter_application_1/rout_manager/rout_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => Repository(ApiManager())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TestApiCubit(context.read<Repository>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Test Api',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: RoutManager().generateRoute,
          initialRoute: RoutManager.login,
        ),
      ),
    );
  }
}
