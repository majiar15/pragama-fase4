import 'package:flutter/material.dart';
import 'package:store_design_system/pages/support_contact_page.dart';

class SupportContactPageShowCase extends StatelessWidget {
  const SupportContactPageShowCase({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: SupportContactPage(),
    ));
  }
}
