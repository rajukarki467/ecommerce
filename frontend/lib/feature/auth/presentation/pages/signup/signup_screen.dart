import 'package:flutter/material.dart';
import 'package:frontend/common/widgets/uihelper.dart';
import 'package:frontend/feature/auth/presentation/pages/signin.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController usernamecontroller = TextEditingController();
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.CustomImage(imgurl: "logo.png"),
              SizedBox(height: 25),
              UiHelper.CustomTexField(
                controller: emailcontroller,
                text: "email",
                toHide: false,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              UiHelper.CustomTexField(
                controller: passwordcontroller,
                text: "password",
                toHide: true,
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 15),
              UiHelper.CustomTexField(
                controller: usernamecontroller,
                text: "username",
                toHide: false,
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 20),
              UiHelper.CustomButton(buttonname: "Sign Up", callback: () {}),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  UiHelper.CustomTextButton(
                    text: "Log In ",
                    callback: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
