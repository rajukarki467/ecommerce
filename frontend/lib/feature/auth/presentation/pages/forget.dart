import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/helper/navigator/app_navigator.dart';
import 'package:frontend/feature/auth/presentation/pages/signin.dart';

class ForgetPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();

  ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _forgotText(),
          const SizedBox(height: 80),
          _emailField(context),
          const SizedBox(height: 15),
          const SizedBox(height: 15),
          _backtohomePage(context),
        ],
      ),
    );
  }

  Widget _forgotText() {
    return Text(
      "Forgot Text",
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(hintText: "Email"),
    );
  }

  Widget _backtohomePage(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: " If Remember your password? \nReturn to   "),
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
