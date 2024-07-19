import 'package:flutter/material.dart';
import 'package:store_design_system/pages/offer_page.dart';

class OfferPageShowCase extends StatelessWidget {
  const OfferPageShowCase({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: OfferPage(),
    ));
  }
}

