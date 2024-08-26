import 'package:flutter/material.dart';
import 'package:store_design_system/foundations.dart';
class BannerTrendingProductsMolecule extends StatelessWidget {
  final String title;
  final String lastDate;
  final String viewAll;
  final String date;
  final void Function() onTapButton;

  const BannerTrendingProductsMolecule({
    super.key,
    required this.date,
    required this.title,
    required this.lastDate,
    required this.viewAll,
    required this.onTapButton,
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
              Text(
                title,
                style: const TextStyle(
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
                    '$lastDate $date',
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
            onPressed: onTapButton,
            key: const Key('homeBannerOffer'),

            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: StoreColorsFoundation.onPrimaryColor),
              foregroundColor: Colors.white,
            ),
            child: Row(
              children: [
                Text(viewAll),
                const Icon(Icons.arrow_forward, color: StoreColorsFoundation.onPrimaryColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
