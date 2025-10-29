import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common/widgets/appbar.dart';
import 'package:frontend/common/helper/navigator/app_navigator.dart';
import 'package:frontend/common/widgets/uihelper.dart';
import 'package:frontend/core/assets/app_images.dart';
import 'package:frontend/feature/auth/data/models/user_creation_req.dart';
import 'package:frontend/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:frontend/feature/auth/presentation/pages/signin.dart';

class SignUp extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "User Crete Successfully",
                  style: TextStyle(color: Colors.greenAccent),
                ),
                backgroundColor: Color.fromARGB(255, 201, 152, 140),
              ),
            );
            return AppNavigator.push(context, SignIn());
          } else if (state is AuthFailure) {
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

          return Padding(
            padding: const EdgeInsets.only(top: 54),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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

                  _signUpText(),
                  const SizedBox(height: 20),

                  _FirstNameField(context),
                  const SizedBox(height: 10),

                  _lastNameField(context),
                  const SizedBox(height: 10),

                  _emailField(context),
                  const SizedBox(height: 10),
                  _passwordField(context),
                  const SizedBox(height: 20),
                  _signUpButton(context),
                  const SizedBox(height: 15),
                  _signup(context),
                ],
              ),
            ),
          );
        },
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
    return UiHelper.CustomTexField(
      controller: _firstNameController,
      text: "first name",
      toHide: false,
      textInputType: TextInputType.name,
    );
  }

  Widget _lastNameField(BuildContext context) {
    return UiHelper.CustomTexField(
      controller: _lastNameController,
      text: "last name",
      toHide: false,
      textInputType: TextInputType.name,
    );
  }

  Widget _emailField(BuildContext context) {
    return UiHelper.CustomTexField(
      controller: _emailController,
      text: "email",
      toHide: false,
      textInputType: TextInputType.emailAddress,
    );
  }

  Widget _passwordField(BuildContext context) {
    return UiHelper.CustomTexField(
      controller: _passwordController,
      text: "password",
      toHide: true,
      textInputType: TextInputType.text,
    );
  }

  Widget _signUpButton(BuildContext context) {
    return UiHelper.CustomButton(
      buttonname: "Sign Up",
      callback: () {
        final user = UserCreationReq(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          lastName: _lastNameController.text.trim(),
          firstName: _firstNameController.text.trim(),
        );

        context.read<AuthBloc>().add(SignUpRequested(user));
      },
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
