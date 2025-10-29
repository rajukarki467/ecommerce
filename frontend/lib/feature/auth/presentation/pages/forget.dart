import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/helper/appbar.dart';
import 'package:frontend/common/helper/navigator/app_navigator.dart';
import 'package:frontend/core/config/theme/app_color.dart';
import 'package:frontend/feature/auth/presentation/pages/signin.dart';

class ForgotPasswordPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _forgotText(),
            const SizedBox(height: 80),
            _emailField(context),
            const SizedBox(height: 10),
            _backtohomePage(context),
            const SizedBox(height: 20),
            _sendResetlinkButton(),
          ],
        ),
      ),
    );
  }

  Widget _forgotText() {
    return Text(
      "Forgot  Password",
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
    );
  }

  Widget _emailField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _emailController,
        decoration: InputDecoration(hintText: "Email"),
      ),
    );
  }

  Widget _backtohomePage(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "Remember your password? "),
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

  Widget _sendResetlinkButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.transparent),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Reset Password",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
      ),
    );
  }
}
