// forget_password.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/rout_manager/rout_manager.dart';
import 'package:flutter_application_1/shered/custome_text_filed/custome_text_filed.dart';

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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // انتقال للصفحة التانية مع تمرير البريد
                    Navigator.pushNamed(
                      context,
                      RoutManager.newPassowrdScreen,
                      arguments: emailController.text,
                    );
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
