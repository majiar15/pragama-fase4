import 'package:flutter/material.dart';
import 'package:store_desing_system/store_desing_system.dart';
import 'package:store_desing_system/templates/cart_template.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});


  @override
  Widget build(BuildContext context) {
    final CartModel cart = CartModel(
      products: [
        ProductCartModel(
          productId: 1,
          quantity: 2,
          title: "Mens Casual Premium Slim Fit T-Shirts ",
          price: 22.3,
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        ),
        ProductCartModel(
          productId: 1,
          quantity: 2,
          title: "Mens C2 ",
          price: 22.3,
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        ),

        ProductCartModel(
          productId: 1,
          quantity: 2,
          title: "Mensq  ",
          price: 22.3,
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        ),
                ProductCartModel(
          productId: 1,
          quantity: 2,
          title: "Mensq  ",
          price: 22.3,
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        ),
                ProductCartModel(
          productId: 1,
          quantity: 2,
          title: "Mensq  ",
          price: 22.3,
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        ),
                ProductCartModel(
          productId: 1,
          quantity: 2,
          title: "Mensq  ",
          price: 22.3,
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        ),
                ProductCartModel(
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