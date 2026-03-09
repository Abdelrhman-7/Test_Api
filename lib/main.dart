import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/shered_pref_controller/shered_pref_controler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/controller/business_logic-layer/test_api_cubit.dart';
import 'package:flutter_application_1/models/api_manager/api_manager.dart';
import 'package:flutter_application_1/models/repository/repository.dart';
import 'package:flutter_application_1/rout_manager/rout_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefController = SharedPrefController();
  bool isLoggedIn = await prefController.isLoggedIn();
  runApp(
    MyApp(initialRoute: isLoggedIn ? RoutManager.home : RoutManager.login),
  );
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

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
          initialRoute: initialRoute, // هنا نستخدم القيمة اللي قرأناها
        ),
      ),
    );
  }
}
