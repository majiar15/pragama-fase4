import 'package:flutter/material.dart';
import 'package:store_design_system/foundation/colors_foundation.dart';
import 'package:store_design_system/store_design_system.dart';
class InputAtom extends StatefulWidget {
  final String label;
  final IconData? iconData;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final InputDecoration decoration;
  final ValueChanged<String> onChanged;
  const InputAtom({
    super.key,
    required this.label,
    this.iconData,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.decoration = const InputDecoration(),
    required this.onChanged,
  });

  @override
  State<InputAtom> createState() => _InputAtomState();
}

class _InputAtomState extends State<InputAtom> {
  bool _obscureText = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _obscureText = widget.isPassword;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: _obscureText,
            decoration: widget.decoration.copyWith(
              prefixIcon:
                  Icon(widget.iconData, color: StoreColorsFoundation.textColor),
              labelText: widget.label,
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: StoreColorsFoundation.inputFillColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(StoreSizesFoundation.borderRadiusM),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(StoreSizesFoundation.borderRadiusM),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: StoreSizesFoundation.borderRadiusL, horizontal: StoreSizesFoundation.borderRadiusSL),
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: StoreColorsFoundation.textHint,
                      ),
                    )
                  : null,
            ),
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
