import 'package:flutter/material.dart';
import 'package:flutter_application_1/business_logic-layer/test_api_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonForget extends StatelessWidget {
  const CustomButtonForget({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.confirmPassword,
    required this.userNameController,
    required this.mobileNumberController,
    required this.countryMobileCode,
    required this.profilePicture,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPassword;
  final TextEditingController userNameController;
  final TextEditingController mobileNumberController;
  final TextEditingController countryMobileCode;
  final TextEditingController profilePicture;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          if (passwordController.text != confirmPassword.text) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Passwords do not match")),
            );
            return;
          }

          context.read<TestApiCubit>().register(
            email: emailController.text,
            password: passwordController.text,
            confirmPassword: confirmPassword.text,
            userName: userNameController.text,
            mobileNumber: mobileNumberController.text,
            countryMobileCode: countryMobileCode.text,
            profilePicture: profilePicture.text,
          );
        }
      },
      child: const Text("Register"),
    );
  }
}
