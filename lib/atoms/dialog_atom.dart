import 'package:flutter/material.dart';
import '../foundation/typography_foundation.dart';
import '../foundation/colors_foundation.dart';
import '../foundation/sizes_foundation.dart';
class DialogAtom extends StatelessWidget {
  final String title;
  final String content;
  final String rightButtonText;
  final String? leftButtonText;
  final VoidCallback onRightButtonPressed;
  final VoidCallback? onLeftButtonPressed;

  const DialogAtom({
    super.key,
    required this.title,
    required this.content,
    required this.rightButtonText,
    this.leftButtonText,
    required this.onRightButtonPressed,
    this.onLeftButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title,
          style: const TextStyle(
            fontSize: StoreTypographyFoundation.fontSizeH4,
            fontWeight: StoreTypographyFoundation.fontWeightBold
          )),
      content: Text(
        content, 
        style: const TextStyle(
          fontSize: StoreTypographyFoundation.fontSizeH4,
          )
        ),
      actions: [
        leftButtonText != null
            ? TextButton(
                onPressed: onLeftButtonPressed,
                child: Text(
                  leftButtonText!,
                  style: const TextStyle(
                    color: StoreColorsFoundation.textColor
                  ),
                ),
              )
            : Container(),
        TextButton(
          onPressed: onRightButtonPressed,
          child: Text(
            rightButtonText,
            style: TextStyle(
                    color: StoreColorsFoundation.primaryColor
                  ),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(StoreSizesFoundation.borderRadiusL),
      ),
    );
  }

  Future show(BuildContext contextMain) {
    return showDialog(
      context: contextMain,
      builder: (BuildContext context) {
        return build(context);
      },
    );
  }
}
