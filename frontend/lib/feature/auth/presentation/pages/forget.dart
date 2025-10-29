import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/widgets/appbar.dart';
import 'package:frontend/common/helper/navigator/app_navigator.dart';
import 'package:frontend/common/widgets/uihelper.dart';
import 'package:frontend/feature/auth/presentation/pages/signin.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

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
    return UiHelper.CustomTexField(
      controller: _emailController,
      text: "Email",
      toHide: false,
      textInputType: TextInputType.emailAddress,
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
    return UiHelper.CustomButton(buttonname: "Reset Link", callback: () {});
  }
}
