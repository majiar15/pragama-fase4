import 'package:flutter/material.dart';
import 'package:store_design_system/templates/forgot_password_template.dart';


class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userController = TextEditingController();

    return ForgotPasswordTemplate(
      emailController: userController,
      onSubmit: () {},
    );
  }
}
