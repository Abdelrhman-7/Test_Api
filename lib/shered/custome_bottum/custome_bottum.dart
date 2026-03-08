import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/api_manager/api_manager.dart';
import 'package:flutter_application_1/rout_manager/rout_manager.dart';

class CustomeBottum extends StatelessWidget {
  const CustomeBottum({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          try {
            await ApiManager().login(
              emailController.text,
              passwordController.text,
            );

            if (!context.mounted) return;
            Navigator.pushNamed(context, RoutManager.home);
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
            }
          }
        }
      },
      child: const Text("Login"),
    );
  }
}
