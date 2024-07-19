import 'package:example/showcase/pages/cart_page_show_case.dart';
import 'package:example/showcase/pages/catalog_page_show_case.dart';
import 'package:example/showcase/pages/contact_support_show_case.dart';
import 'package:example/showcase/pages/create_account_page_show_case.dart';
import 'package:example/showcase/pages/forgot_password_page_showcase.dart';
import 'package:example/showcase/pages/home_page_show_case.dart';
import 'package:example/showcase/pages/offer_page_show_case.dart';
import 'package:example/showcase/pages/product_detail_page_show_case.dart';
import 'package:flutter/material.dart';
import 'package:store_design_system/pages/offer_page.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:flutter_models_commons/flutter_models_commons.dart' show ProductModel, Rating;

import 'login_page_show_case.dart';

class PageShowcase extends StatefulWidget {
  const PageShowcase({super.key});

  @override
  State<PageShowcase> createState() => _PageShowcaseState();
}

class _PageShowcaseState extends State<PageShowcase> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const List<Widget> _widgetOptions = <Widget>[
      Text('Home Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      Text('Search Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      Text('Profile Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pages Showcase'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Login Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginPageShowCase()),
            ),
          ),
          ListTile(
            title: const Text('Create Account Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateAccountPageShowCase()),
            ),
          ),
          ListTile(
            title: const Text('forgot password Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ForgotPasswordPageShowCase()),
            ),
          ),

          ListTile(
            title: const Text('Home Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePageShowCase()),
            ),
          ),

          ListTile(
            title: const Text('Product detail Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductDetailPageShowCase(),
                settings: RouteSettings(
                  arguments: ProductModel(
                      id: 5,
                      title:
                          "John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet",
                      price: 695,
                      description:
                          "From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.",
                      category: "jewelery",
                      image:
                          "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
                      rating: Rating(rate: 4.6, count: 400)),
                ),
              ),
            ),
          ),

          ListTile(
            title: const Text('Ofert Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OfferPageShowCase(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Catalog Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CatalogPageShowCase(),
              ),
            ),
          ),

          ListTile(
            title: const Text('Carrito'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPageShowCase()
              ),
            ),
          ),
          ListTile(
            title: const Text('Soporte y contacto'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SupportContactPageShowCase()
              ),
            ),
          ),
        ],
      ),
    );
  }
}
