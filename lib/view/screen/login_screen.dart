import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_layer/model/response_api.dart';
import 'package:flutter_application_1/rout_manager/rout_manager.dart';
import 'package:flutter_application_1/shered/custome_bottum/custome_bottum.dart';
import 'package:flutter_application_1/shered/custome_text_filed/custome_text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.response});
  final ResponseApi response;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailContler;
  late TextEditingController passwordController;
  late TextEditingController confirmPassword;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailContler = TextEditingController(text: "abc@gmail.com");
    passwordController = TextEditingController(text: "123456");
    confirmPassword = TextEditingController(text: "123456");
  }

  @override
  void dispose() {
    emailContler.dispose();
    passwordController.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login screen"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: emailContler,
                errorText: 'Please enter your email',
                hintText: "Enter your email",
                labelText: "Email",
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: passwordController,
                errorText: 'Please enter your passowrd',
                hintText: "Enter your passowrd",
                labelText: "passowrd",
              ),
              SizedBox(height: 20),

              CustomeBottum(
                emailController: emailContler,
                passwordController: passwordController,
                formKey: _formKey,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutManager.registerscreen);
                },
                child: Text("Forget Password"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutManager.forgetPassword);
                },
                child: Text("forget password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
