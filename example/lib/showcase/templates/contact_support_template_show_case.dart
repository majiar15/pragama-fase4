import 'package:flutter/material.dart';
import 'package:store_design_system/templates/support_contact_template.dart';


class SupportContactTemplateShowCase extends StatelessWidget {
  const SupportContactTemplateShowCase({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SupportContactTemplate()
        ),
    );
  }
}
