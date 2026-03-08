import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/business_logic-layer/test_api_cubit.dart';
import 'package:flutter_application_1/rout_manager/rout_manager.dart';
import 'package:flutter_application_1/shered/custome_bottum/custom_bottum_register_button.dart';
import 'package:flutter_application_1/shered/custome_text_filed/custome_text_filed.dart';
import 'package:flutter_application_1/models/model/response_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassword;
  late TextEditingController userNameController;
  late TextEditingController mobileNumberController;
  late TextEditingController countryMobileCode;
  late TextEditingController profilePicture;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: "abc@gmail.com");
    passwordController = TextEditingController(text: "123456");
    confirmPassword = TextEditingController(text: "123456");
    userNameController = TextEditingController(text: "abc");
    mobileNumberController = TextEditingController(text: "123456789");
    countryMobileCode = TextEditingController(text: "+966");
    profilePicture = TextEditingController(text: "");
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPassword.dispose();
    userNameController.dispose();
    mobileNumberController.dispose();
    countryMobileCode.dispose();
    profilePicture.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Screen"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<TestApiCubit, TestApiState>(
          listener: (context, state) {
            if (state is TestApiSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
              Navigator.pushNamed(
                context,
                RoutManager.login,
                arguments: ResponseApi(email: emailController.text),
              );
            } else if (state is TestApiError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      controller: userNameController,
                      errorText: 'Please enter your user name',
                      hintText: "Enter your user name",
                      labelText: "User Name",
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: mobileNumberController,
                      errorText: 'Please enter your mobile number',
                      hintText: "Enter your mobile number",
                      labelText: "Mobile Number",
                    ),
                    const SizedBox(height: 20),
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
                    CustomTextField(
                      controller: confirmPassword,
                      errorText: 'Please confirm password',
                      hintText: "Enter your password",
                      labelText: "Confirm Password",
                    ),
                    const SizedBox(height: 20),
                    if (state is TestApiLoading)
                      const CircularProgressIndicator()
                    else
                      CustomRegisterButton(
                        emailController: emailController,
                        passwordController: passwordController,
                        formKey: _formKey,
                        confirmPassword: confirmPassword,
                        userNameController: userNameController,
                        mobileNumberController: mobileNumberController,
                        countryMobileCode: countryMobileCode,
                        profilePicture: profilePicture,
                        text: "register",
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
