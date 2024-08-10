import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';

class CreateAccountTemplate extends StatelessWidget {
  final TextEditingController userController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final void Function(String) onChangeUserText;
  final void Function(String) onChangePasswordText;
  final void Function(String) onChangeConfirmPasswordText;
  final void Function() onTapCreateAccount;
  final void Function() onTapLoginLink;

  CreateAccountTemplate({
    super.key,
    required this.userController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onTapCreateAccount,
    required this.onTapLoginLink,
    this.onChangeUserText = _defaultOnChange,
    this.onChangePasswordText = _defaultOnChange,
    this.onChangeConfirmPasswordText = _defaultOnChange,
  });

  static void _defaultOnChange(String text) {}

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

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
                        return 'Por favor ingrese una contraseña';
                      }
                      if (value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                    onChanged: onChangePasswordText,
                  ),
                  const SizedBox(
                    height: StoreSpacingFoundation.md,
                  ),
                  InputAtom(
                    iconData: Icons.lock,
                    label: "Confirmar Contraseña",
                    controller: confirmPasswordController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor confirme su contraseña';
                      }
                      if (value != passwordController.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                    onChanged: onChangeConfirmPasswordText,
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
                                  fontWeight: StoreTypographyFoundation.fontWeightBold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ', estás de acuerdo con la oferta pública',
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
                      label: "Registrarse",
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          onTapCreateAccount();
                        }
                      },
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
          ),
        ),
      ),
    );
  }
}
