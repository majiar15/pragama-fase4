import 'package:flutter/material.dart';
import 'package:store_desing_system/foundation/sizes_foundation.dart';
import 'package:store_desing_system/store_desing_system.dart';

class CreateAccountTemplate extends StatelessWidget {
  final TextEditingController userController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  void Function(String) onChangeUserText;
  void Function(String) onChangePasswordText;
  void Function(String) onChangeConfirmPasswordText;
  void Function() onTapCreateAccount;
  void Function() onTapLoginLink;
  CreateAccountTemplate(
      {super.key,
      required this.userController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.onTapCreateAccount,
      required this.onTapLoginLink,
      this.onChangeUserText = _defaultOnChange,
      this.onChangePasswordText = _defaultOnChange,
      this.onChangeConfirmPasswordText = _defaultOnChange});

  static void _defaultOnChange(String text) {}

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double paddingTop = MediaQuery.of(context).padding.top;
    final double paddingBottom = MediaQuery.of(context).padding.bottom;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(StoreSizesFoundation.paddingM),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Crear una",
                style: TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH1,
                    fontWeight: StoreTypographyFoundation.fontWeightBold),
              ),
              const Text(
                "cuenta",
                style: TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH1,
                    fontWeight: StoreTypographyFoundation.fontWeightBold),
              ),
              const SizedBox(
                height: StoreSpacingFoundation.lg,
              ),
              InputAtom(
                  iconData: Icons.person,
                  label: "usuario",
                  controller: userController,
                  onChanged: onChangeUserText),
              const SizedBox(
                height: StoreSpacingFoundation.md,
              ),
              InputAtom(
                iconData: Icons.lock,
                label: "Contraseña",
                controller: passwordController,
                onChanged: onChangePasswordText,
                isPassword: true,
              ),
              const SizedBox(
                height: StoreSpacingFoundation.md,
              ),
              InputAtom(
                iconData: Icons.lock,
                label: "Confirmar Contraseña",
                controller: confirmPasswordController,
                onChanged: onChangeConfirmPasswordText,
                isPassword: true,
              ),
              const SizedBox(
                height: StoreSpacingFoundation.md,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      width: screenSize.width * 0.7,
                      child: RichText(
                        text: const TextSpan(
                          text: 'Al hacer clic en el botón ',
                          style: TextStyle(
                            color: StoreColorsFoundation.textColor,
                            fontSize: StoreTypographyFoundation.fontSizeH5,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Registrarse',
                              style: TextStyle(
                                color: StoreColorsFoundation.primaryColor,
                                fontWeight:
                                    StoreTypographyFoundation.fontWeightBold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ', estás de acuerdo con la oferta pública',
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: StoreSpacingFoundation.xl,
              ),
              Center(
                child: ButtonAtom(
                  label: "Registrarse",
                  onPressed: onTapCreateAccount,
                ),
              ),
              const SizedBox(
                height: StoreSpacingFoundation.lg,
              ),
              Row(
                children: [
                  const Text(
                    "Ya tengo una cuenta",
                    style: TextStyle(
                        fontSize: StoreTypographyFoundation.fontSizeH5,
                        color: StoreColorsFoundation.textColor),
                  ),
                  const SizedBox(
                    width: StoreSpacingFoundation.s,
                  ),
                  GestureDetector(
                    onTap: onTapLoginLink,
                    child: const Text(
                      "Ingresar",
                      style: TextStyle(
                          fontSize: StoreTypographyFoundation.fontSizeH5,
                          color: StoreColorsFoundation.primaryColor,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
