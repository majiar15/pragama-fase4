import 'package:flutter/material.dart';
import 'package:store_desing_system/foundation/colors_foundation.dart';
import 'package:store_desing_system/foundation/sizes_foundation.dart';
import 'package:store_desing_system/store_desing_system.dart';

class BannerTrendingProductsMolecule extends StatelessWidget {
  final String date;
  final void Function() onTapButon;
  const BannerTrendingProductsMolecule({
    super.key,
    required this.date,
    required this.onTapButon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(StoreSizesFoundation.paddingM),
      decoration: BoxDecoration(
        color: StoreColorsFoundation.primaryColor,
        borderRadius: BorderRadius.circular(StoreSizesFoundation.paddingM),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Productos en Oferta',
                style: TextStyle(
                  color: StoreColorsFoundation.onPrimaryColor,
                  fontSize: StoreTypographyFoundation.fontSizeH4,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: StoreSpacingFoundation.s),
              Row(
                children:  [
                  const Icon(Icons.calendar_today, color:StoreColorsFoundation.onPrimaryColor),
                  const SizedBox(width: StoreSpacingFoundation.s),
                  Text(
                    'Ultimo Dia $date',
                    style: const TextStyle(
                      color: StoreColorsFoundation.onPrimaryColor,
                      fontSize: StoreTypographyFoundation.fontSizeH5,
                    ),
                  ),
                ],
              ),
            ],
          ),
          OutlinedButton(
            onPressed: onTapButon,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: StoreColorsFoundation.onPrimaryColor),
              foregroundColor: Colors.white,
            ),
            child: Row(
              children: const [
                Text('View all'),
                Icon(Icons.arrow_forward, color: StoreColorsFoundation.onPrimaryColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
