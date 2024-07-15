import 'package:flutter/material.dart';
import 'package:store_desing_system/store_desing_system.dart';

class CardCartOrganism extends StatelessWidget {
  final ProductCartModel product;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CardCartOrganism({
    super.key,
    required this.product,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(StoreSizesFoundation.marginS),
      child: Padding(
        padding: const EdgeInsets.all(StoreSizesFoundation.paddingS),
        child: Row(
          children: [
            Image.network(product.image, width: 100, height: 100),
            const SizedBox(width: StoreSpacingFoundation.s),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: StoreTypographyFoundation.fontSizeH4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Precio: \$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: StoreTypographyFoundation.fontSizeH5
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const  Icon(Icons.remove),
                            onPressed: onDecrease,
                          ),
                          Text('${product.quantity}'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: onIncrease,
                          ),
                        ],
                      ),
                      Text(
                        'Total: \$${(product.price * product.quantity).toStringAsFixed(2)}',
                        style: const  TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
