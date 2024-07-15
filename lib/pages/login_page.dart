import 'package:flutter/material.dart';

import '../templates/login_template.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return LoginTemplate(
      userController: userController,
      passwordController: passwordController,
      onTapForgotPassword: () => {print("forgot password")},
      onTapLogin: () => {print("login")},
      onTapSignUp: () => {print("sigup")},
      onChangePasswordText: (text) => {print("change passs")},
      onChangeUserText: (text) => {print("change user")},
    );
  }
}