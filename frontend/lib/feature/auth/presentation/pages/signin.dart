import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common/helper/navigator/app_navigator.dart';
import 'package:frontend/common/widgets/uihelper.dart';
import 'package:frontend/core/assets/app_images.dart';
import 'package:frontend/feature/auth/data/models/user_signin_req.dart';
import 'package:frontend/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:frontend/feature/auth/presentation/pages/forget.dart';
import 'package:frontend/feature/auth/presentation/pages/signup.dart';
import 'package:frontend/feature/home/presentation/pages/bottomnavbarScreen.dart';

class SignIn extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Login Successful",
                  style: TextStyle(color: Colors.greenAccent),
                ),
                backgroundColor: Color.fromARGB(255, 201, 152, 140),
              ),
            );
            AppNavigator.pushReplacement(context, BottomNavBarPage());
          }
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.massage,
                  style: TextStyle(color: Colors.red),
                ),
                backgroundColor: Color.fromARGB(255, 201, 152, 140),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),

                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.logo),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),
                      _signinText(),
                      const SizedBox(height: 20),

                      UiHelper.CustomTexField(
                        controller: _emailController,
                        text: "Email",
                        toHide: false,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }

                          // Trim spaces
                          value = value.trim();

                          // General email format check
                          final emailRegex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@gmail\.com$',
                          );

                          if (!emailRegex.hasMatch(value)) {
                            if (value.contains('@') &&
                                !value.endsWith('@gmail.com')) {
                              return 'Only Gmail addresses are allowed';
                            }
                            return 'Please enter a valid Gmail address (e.g. raju@gmail.com)';
                          }

                          return null; // ✅ valid
                        },
                      ),
                      const SizedBox(height: 10),
                      UiHelper.CustomTexField(
                        controller: _passwordController,
                        text: "password",
                        toHide: true,
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (value.length < 8) {
                            return 'Please enter a password more than 8 character ';
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          UiHelper.CustomTextButton(
                            text: "Forgot password?",
                            callback: () {
                              AppNavigator.push(context, ForgotPasswordPage());
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      UiHelper.CustomButton(
                        buttonname: "Log In",
                        callback: () {
                          if (_formKey.currentState!.validate()) {
                            final user = UserSigninReq(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            );

                            context.read<AuthBloc>().add(SignInRequested(user));
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.icon),
                          UiHelper.CustomTextButton(
                            text: "Log in with Facebook",
                            callback: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "OR",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _signup(context),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _signinText() {
    return Text(
      "Sign In",
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
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
