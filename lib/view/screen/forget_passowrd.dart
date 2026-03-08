// forget_password.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/business_logic-layer/test_api_cubit.dart';
import 'package:flutter_application_1/shered/custome_bottum/custom_bottum_register_button.dart';
import 'package:flutter_application_1/shered/custome_text_filed/custome_text_filed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassowrd extends StatefulWidget {
  const ForgetPassowrd({super.key});

  @override
  State<ForgetPassowrd> createState() => _ForgetPassowrdState();
}

class _ForgetPassowrdState extends State<ForgetPassowrd> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: "abc@gmail.com");
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forget Password"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<TestApiCubit, TestApiState>(
          listener: (context, state) {
            if (state is TestApiSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "We have sent an email to you. If you need any help, contact us on support@nader.com",
                  ),
                ),
              );
            } else if (state is TestApiError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error: ${state.message}")),
              );
            }
          },
          builder: (context, state) {
            return Form(
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
                  if (state is TestApiLoading)
                    const CircularProgressIndicator()
                  else
                    CustomRegisterButton(
                      emailController: emailController,
                      formKey: _formKey,
                      text: "forget password",
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
