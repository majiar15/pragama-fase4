import 'package:flutter/material.dart';
import 'package:store_design_system/foundation/sizes_foundation.dart';
import 'package:store_design_system/store_design_system.dart';

class ForgotPasswordTemplate extends StatelessWidget {
  final TextEditingController emailController;
  final void Function(String) onChangeEmailText;
  final void Function() onSubmit;

  ForgotPasswordTemplate({
    super.key,
    required this.emailController,
    required this.onSubmit,
    this.onChangeEmailText = _defaultOnChange,
  });

  static void _defaultOnChange(String text) {}

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(StoreSizesFoundation.paddingM),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                    key: const Key('forgotPassInputEmail'),
                    iconData: Icons.email,
                    label: "Ingrese su Email",
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su correo electrónico';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Por favor ingrese un correo electrónico válido';
                      }
                      return null;
                    },
                    onChanged: onChangeEmailText,
                  ),
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
                      key: const Key('forgotPassButtonSend'),
                      label: "Enviar",
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          onSubmit();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
