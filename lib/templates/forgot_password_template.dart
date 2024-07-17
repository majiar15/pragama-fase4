import 'package:flutter/material.dart';
import 'package:store_design_system/foundation/sizes_foundation.dart';
import 'package:store_design_system/store_design_system.dart';
class ForgotPasswordTemplate extends StatelessWidget {
  final TextEditingController emailController;
  void Function(String) onChangeEmailText;
  void Function() onSubmit;
  ForgotPasswordTemplate({
    super.key,
    required this.emailController,
    required this.onSubmit,
    this.onChangeEmailText = _defaultOnChange,
  });

  static void _defaultOnChange(String text) {}

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
  print(size.width - (StoreSizesFoundation.paddingM * 2));
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(StoreSizesFoundation.paddingM),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "¿Olvidó su",
                style: TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH1,
                    fontWeight: StoreTypographyFoundation.fontWeightBold),
              ),
              const Text(
                "contraseña?",
                style: TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH1,
                    fontWeight: StoreTypographyFoundation.fontWeightBold),
              ),
              const SizedBox(
                height: StoreSpacingFoundation.lg,
              ),
              InputAtom(
                  iconData: Icons.email,
                  label: "ingrese su Email",
                  controller: emailController,
                  onChanged: onChangeEmailText),
              const SizedBox(
                height: StoreSpacingFoundation.md,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: StoreColorsFoundation.primaryColor,
                          fontSize: StoreTypographyFoundation.fontSizeH5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                ' Le enviaremos un mensaje para configurar o restablecer su nueva contraseña',
                            style: TextStyle(
                              color: StoreColorsFoundation.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: StoreSpacingFoundation.xl,
              ),
              Center(
                child: ButtonAtom(
                  label: "Enviar",
                  onPressed: onSubmit,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
