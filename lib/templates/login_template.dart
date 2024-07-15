import 'package:flutter/material.dart';
import 'package:store_desing_system/foundation/sizes_foundation.dart';
import 'package:store_desing_system/store_desing_system.dart';

class LoginTemplate extends StatelessWidget {
  final TextEditingController userController;
  final TextEditingController passwordController;
  void Function(String) onChangeUserText;
  void Function(String) onChangePasswordText;
  void Function() onTapForgotPassword;
  void Function() onTapLogin;
  void Function() onTapSignUp;
  LoginTemplate({
    super.key,
    required this.userController,
    required this.passwordController,
    required this.onTapForgotPassword,
    required this.onTapLogin,
    required this.onTapSignUp,
    this.onChangeUserText = _defaultOnChange,
    this.onChangePasswordText = _defaultOnChange
  });

    static void _defaultOnChange(String text) {}

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(
          StoreSizesFoundation.paddingM,
          StoreSizesFoundation.paddingL,
          StoreSizesFoundation.paddingM,
          StoreSizesFoundation.paddingM,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "¡Bienvenido",
                style: TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH1,
                    fontWeight: StoreTypographyFoundation.fontWeightBold),
              ),
              const Text(
                "De nuevo!",
                style: TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH1,
                    fontWeight: StoreTypographyFoundation.fontWeightBold),
              ),
              const SizedBox(
                height: StoreSpacingFoundation.lg,
              ),
              InputAtom(
                  iconData: Icons.person,
                  label: "Usuario",
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
                height: StoreSpacingFoundation.s,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: onTapForgotPassword ,
                    child: const Text(
                      "¿Has olvidado tu contraseña?",
                      style: TextStyle(
                          fontSize: StoreTypographyFoundation.fontSizeH5,
                          color: StoreColorsFoundation.primaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: StoreSpacingFoundation.xl,
              ),
              Center(
                child: ButtonAtom(
                  label: "Ingresar",
                  onPressed: onTapLogin,
                ),
              ),
              const SizedBox(
                height: StoreSpacingFoundation.xl,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text(
                    "Crear una cuenta ",
                    style: TextStyle(
                      fontSize: StoreTypographyFoundation.fontSizeH5,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTapSignUp,
                    child: const Text(
                      "Registrarse",
                      style: TextStyle(
                          color: StoreColorsFoundation.primaryColor,
                          fontSize: StoreTypographyFoundation.fontSizeH5,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
