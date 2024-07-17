import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';

class CatalogPageShowCase extends StatelessWidget {
  const CatalogPageShowCase({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: CatalogPage(),
    ));
  }
}
