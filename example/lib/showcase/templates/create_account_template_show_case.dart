import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';

class CreateAccountTemplateShowCase extends StatelessWidget {
  const CreateAccountTemplateShowCase({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return CreateAccountTemplate(
      userController: userController,
      passwordController: passwordController,
      onChangePasswordText: (text) => {print("change passs")},
      onChangeUserText: (text) => {print("change user")},
      confirmPasswordController: passwordController,
      onTapCreateAccount: () {},
      onTapLoginLink: () {},
    );
  }
}
