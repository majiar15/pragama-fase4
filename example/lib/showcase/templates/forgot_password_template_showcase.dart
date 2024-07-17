import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';


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
