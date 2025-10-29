import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/helper/navigator/app_navigator.dart';
import 'package:frontend/core/config/theme/app_color.dart';
import 'package:frontend/feature/auth/presentation/pages/forget.dart';
import 'package:frontend/feature/auth/presentation/pages/signup.dart';

class SignIn extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  SignIn({super.key});

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
              _signinText(),
              const SizedBox(height: 80),
              _emailField(context),
              const SizedBox(height: 15),
              _passwordField(context),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _forgetpasswordText(context),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _signInButton(),
              const SizedBox(height: 15),
              _signup(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signinText() {
    return Text(
      "Sign In",
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
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
      decoration: InputDecoration(hintText: "Password"),
    );
  }

  Widget _forgetpasswordText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, ForgotPasswordPage());
      },
      child: Text(
        "Forget Password?",
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _signInButton() {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(color: Colors.transparent),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Sign In",
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
          TextSpan(text: "Don't have an Account?  "),
          TextSpan(
            text: "Sign Up",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignUp());
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
