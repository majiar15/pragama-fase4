import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';

class LoginTemplate extends StatelessWidget {
  final TextEditingController userController;
  final TextEditingController passwordController;
  final bool isLoadingButtonLogin;
  final void Function(String) onChangeUserText;
  final void Function(String) onChangePasswordText;
  final void Function() onTapForgotPassword;
  final void Function() onTapLogin;
  final void Function() onTapSignUp;

  LoginTemplate({
    super.key,
    required this.userController,
    required this.passwordController,
    required this.onTapForgotPassword,
    required this.onTapLogin,
    required this.onTapSignUp,
    this.isLoadingButtonLogin = false,
    this.onChangeUserText = _defaultOnChange,
    this.onChangePasswordText = _defaultOnChange,
  });

  static void _defaultOnChange(String text) {}

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su nombre de usuario';
                      }
                      return null;
                    },
                    onChanged: onChangeUserText,
                  ),
                  const SizedBox(
                    height: StoreSpacingFoundation.md,
                  ),
                  InputAtom(
                    iconData: Icons.lock,
                    label: "Contraseña",
                    controller: passwordController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su contraseña';
                      }
                      if (value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                    onChanged: onChangePasswordText,
                  ),
                  const SizedBox(
                    height: StoreSpacingFoundation.s,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: onTapForgotPassword,
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
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          onTapLogin();
                        }
                      },
                      loading: isLoadingButtonLogin,
                    ),
                  ),
                  const SizedBox(
                    height: StoreSpacingFoundation.xl,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
          ),
        ),
      ),
    );
  }
}
