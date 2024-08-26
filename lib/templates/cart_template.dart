import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:store_design_system/foundation/text_foundation.dart' show StoreTextFoundation;
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
        appBar: AppBarMolecule(
            title: Text(
                StoreTextFoundation.cartAppBarTitle,
                style: const TextStyle(
                  color: StoreColorsFoundation.textColor,
                  fontSize: StoreTypographyFoundation.fontSizeH3,
                ))),
        body: widget.cart.products.isEmpty
            ? Center(
                child: Text(
                  StoreTextFoundation.cartEmptyCartMessage,
                  style: const TextStyle(
                    color: StoreColorsFoundation.textColor,
                    fontSize: StoreTypographyFoundation.fontSizeH3,
                  ),
                ),
              )
            : Column(
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
                          priceLabel: StoreTextFoundation.cartPriceLabel,
                          totalLabel: StoreTextFoundation.cartTotalPriceLabel,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.all(StoreSizesFoundation.paddingS),
                    child: Column(
                      children: [
                        Text(
                          '${StoreTextFoundation.cartTotalPurchaseLabel}: \$${_calculateTotal().toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: StoreTypographyFoundation.fontSizeH4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: StoreSpacingFoundation.s),
                        ButtonAtom(
                          key: const Key("cartButtonBuy"),
                            label: StoreTextFoundation.cartBuyButtonLabel,
                            onPressed: widget.onTapBuyNow),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
