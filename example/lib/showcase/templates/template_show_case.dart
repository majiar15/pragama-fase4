import 'package:example/showcase/pages/cart_page_show_case.dart';
import 'package:example/showcase/pages/catalog_page_show_case.dart';
import 'package:example/showcase/pages/contact_support_show_case.dart';
import 'package:example/showcase/pages/create_account_page_show_case.dart';
import 'package:example/showcase/pages/forgot_password_page_showcase.dart';
import 'package:example/showcase/pages/home_page_show_case.dart';
import 'package:example/showcase/pages/product_detail_page_show_case.dart';
import 'package:example/showcase/templates/cart_template_show_case.dart';
import 'package:example/showcase/templates/catalog_template_show_case.dart';
import 'package:example/showcase/templates/contact_support_template_show_case.dart';
import 'package:example/showcase/templates/create_account_template_show_case.dart';
import 'package:example/showcase/templates/forgot_password_template_showcase.dart';
import 'package:example/showcase/templates/home_template_show_case.dart';
import 'package:example/showcase/templates/product_detail_template_show_case.dart';
import 'package:flutter/material.dart';
import 'package:store_desing_system/store_desing_system.dart';
import 'login_template_show_case.dart';

class TemplateShowCase extends StatefulWidget {
  const TemplateShowCase({super.key});

  @override
  State<TemplateShowCase> createState() => TemplateShowCaseState();
}

class TemplateShowCaseState extends State<TemplateShowCase> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Template ShowCase'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Login Template'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginTemplateShowCase()),
            ),
          ),
          ListTile(
            title: const Text('Create Account Template'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateAccountTemplateShowCase()),
            ),
          ),
          ListTile(
            title: const Text('forgot password Template'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ForgotPasswordTemplateShowCase()),
            ),
          ),

          ListTile(
            title: const Text('Home Template'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeTemplateShowCase()),
            ),
          ),

          ListTile(
            title: const Text('Product detail Template'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductDetailTemplateShowCase(),
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
            title: const Text('Catalog Template'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CatalogTemplateShowCase(),
              ),
            ),
          ),

          ListTile(
            title: const Text('Carrito Template'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartTemplateShowCase()
              ),
            ),
          ),
          ListTile(
            title: const Text('Soporte y contacto Template'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SupportContactTemplateShowCase()
              ),
            ),
          ),
        ],
      ),
    );
  }
}
