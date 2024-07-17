import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:flutter_models_commons/flutter_models_commons.dart'
    show CartUIModel;

class CartTemplate extends StatefulWidget {
  final CartUIModel cart;
  final VoidCallback onTapBuyNow;
  const CartTemplate(
      {super.key, required this.cart, required this.onTapBuyNow});

  @override
  CartTemplateState createState() => CartTemplateState();
}

class CartTemplateState extends State<CartTemplate> {
  void _increaseQuantity(int index) {
    setState(() {
      widget.cart.products[index].quantity++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (widget.cart.products[index].quantity > 1) {
        widget.cart.products[index].quantity--;
      } else {
        widget.cart.products.removeAt(index);
      }
    });
  }

  double _calculateTotal() {
    double total = 0;
    for (var product in widget.cart.products) {
      total += product.price * product.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarMolecule(
            title: Text("CARRITO",
                style: TextStyle(
                    color: StoreColorsFoundation.textColor,
                    fontSize: StoreTypographyFoundation.fontSizeH3))),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cart.products.length,
                itemBuilder: (context, index) {
                  final product = widget.cart.products[index];
                  return CardCartOrganism(
                    product: product,
                    onIncrease: () => _increaseQuantity(index),
                    onDecrease: () => _decreaseQuantity(index),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(StoreSizesFoundation.paddingS),
              child: Column(
                children: [
                  Text(
                    'Total de la Compra: \$${_calculateTotal().toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: StoreTypographyFoundation.fontSizeH4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: StoreSpacingFoundation.s),
                  ButtonAtom(
                      label: 'Realizar Compra', onPressed: widget.onTapBuyNow),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
