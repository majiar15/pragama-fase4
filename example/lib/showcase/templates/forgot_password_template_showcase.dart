import 'package:flutter/material.dart';
import 'package:store_desing_system/store_desing_system.dart';


class ForgotPasswordTemplateShowCase extends StatelessWidget {
  const ForgotPasswordTemplateShowCase({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userController = TextEditingController();

    return ForgotPasswordTemplate(
      emailController: userController,
      onSubmit: () {},
    );
  }
}
