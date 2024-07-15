import 'package:flutter/material.dart';
import 'package:store_desing_system/store_desing_system.dart';

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
