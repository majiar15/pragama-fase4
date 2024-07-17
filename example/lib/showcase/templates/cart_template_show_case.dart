import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:flutter_models_commons/flutter_models_commons.dart' show CartUIModel, ProductCartUIModel;


class CartTemplateShowCase extends StatelessWidget {
  const CartTemplateShowCase({super.key});


  @override
  Widget build(BuildContext context) {
    final CartUIModel cart = CartUIModel(
      products: [
        ProductCartUIModel(
          productId: 1,
          quantity: 2,
          title: "Mens Casual Premium Slim Fit T-Shirts ",
          price: 22.3,
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        ),
        ProductCartUIModel(
          productId: 1,
          quantity: 2,
          title: "Mens C2 ",
          price: 22.3,
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        ),

        ProductCartUIModel(
          productId: 1,
          quantity: 2,
          title: "Mensq  ",
          price: 22.3,
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        ),
                ProductCartUIModel(
          productId: 1,
          quantity: 2,
          title: "Mensq  ",
          price: 22.3,
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        ),
                ProductCartUIModel(
          productId: 1,
          quantity: 2,
          title: "Mensq  ",
          price: 22.3,
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        ),
                ProductCartUIModel(
          productId: 1,
          quantity: 2,
          title: "Mensq  ",
          price: 22.3,
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        ),
                ProductCartUIModel(
          productId: 1,
          quantity: 2,
          title: "Mensq  ",
          price: 22.3,
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        ),
      ]
    );

    return CartTemplate(
      cart: cart,
      onTapBuyNow: () { 
        print("comprar");
       }
    );
  }
}