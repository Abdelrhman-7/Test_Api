import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/business_logic-layer/test_api_cubit.dart';
import 'package:flutter_application_1/models/model/response_api.dart';
import 'package:flutter_application_1/rout_manager/rout_manager.dart';
import 'package:flutter_application_1/shered/custome_bottum/custom_bottum_register_button.dart';
import 'package:flutter_application_1/shered/custome_text_filed/custome_text_filed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: "abc@gmail.com");
    passwordController = TextEditingController(text: "123456");
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Screen"), centerTitle: true),
      body: BlocConsumer<TestApiCubit, TestApiState>(
        listener: (context, state) {
          if (state is TestApiSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
            Navigator.pushNamed(context, RoutManager.home);
          } else if (state is TestApiError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: emailController,
                    errorText: 'Please enter your email',
                    hintText: "Enter your email",
                    labelText: "Email",
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: passwordController,
                    errorText: 'Please enter your password',
                    hintText: "Enter your password",
                    labelText: "Password",
                  ),
                  const SizedBox(height: 20),

                  CustomRegisterButton(
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: _formKey,
                    text: "login",
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutManager.registerscreen);
                    },
                    child: const Text("Register Screen"),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutManager.forgetPassword);
                    },
                    child: const Text("Forget Password"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
