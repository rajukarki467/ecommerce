import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/helper/navigator/app_navigator.dart';
import 'package:frontend/core/config/theme/app_color.dart';
import 'package:frontend/feature/auth/presentation/pages/signin.dart';

class SignUp extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signUpText(),
              const SizedBox(height: 80),

              _FirstNameField(context),
              const SizedBox(height: 15),

              _lastNameField(context),
              const SizedBox(height: 15),

              _emailField(context),
              const SizedBox(height: 15),
              _passwordField(context),
              const SizedBox(height: 35),
              _signUpButton(),
              const SizedBox(height: 15),
              _signup(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpText() {
    return Text(
      "Sign Up",
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
    );
  }

  Widget _FirstNameField(BuildContext context) {
    return TextField(
      controller: _firstNameController,
      decoration: InputDecoration(hintText: "First Name"),
    );
  }

  Widget _lastNameField(BuildContext context) {
    return TextField(
      controller: _lastNameController,
      decoration: InputDecoration(hintText: "Last Name"),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(hintText: "Email"),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(hintText: " Password"),
    );
  }

  Widget _signUpButton() {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(color: Colors.transparent),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Sign Up",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
      ),
    );
  }

  Widget _signup(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "Already have an Account? "),
          TextSpan(
            text: "Sign In",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignIn());
              },
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
