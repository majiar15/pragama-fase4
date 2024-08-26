import 'package:flutter/material.dart';
import 'package:store_design_system/foundation/text_foundation.dart';
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
                  Text(
                    StoreTextFoundation.createAccountTitleLine1,
                    style: const TextStyle(
                        fontSize: StoreTypographyFoundation.fontSizeH1,
                        fontWeight: StoreTypographyFoundation.fontWeightBold),
                  ),
                  Text(
                    StoreTextFoundation.createAccountTitleLine2,
                    style: const TextStyle(
                        fontSize: StoreTypographyFoundation.fontSizeH1,
                        fontWeight: StoreTypographyFoundation.fontWeightBold),
                  ),
                  const SizedBox(
                    height: StoreSpacingFoundation.lg,
                  ),
                  InputAtom(
                    key: const Key('createAccountUsernameField'),
                    iconData: Icons.person,
                    label: StoreTextFoundation.createAccountUsernameLabel,
                    controller: userController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StoreTextFoundation.createAccountUsernameValidatorEmpty;
                      }
                      return null;
                    },
                    onChanged: onChangeUserText,
                  ),
                  const SizedBox(
                    height: StoreSpacingFoundation.md,
                  ),
                  InputAtom(
                    key: const Key('createAccountPasswordField'),
                    iconData: Icons.lock,
                    label: StoreTextFoundation.createAccountPasswordLabel,
                    controller: passwordController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StoreTextFoundation.createAccountPasswordValidatorEmpty;
                      }
                      if (value.length < 6) {
                        return StoreTextFoundation.createAccountPasswordValidatorShort;
                      }
                      return null;
                    },
                    onChanged: onChangePasswordText,
                  ),
                  const SizedBox(
                    height: StoreSpacingFoundation.md,
                  ),
                  InputAtom(
                    key: const Key('createAccountConfirmPasswordField'),
                    iconData: Icons.lock,
                    label: StoreTextFoundation.createAccountConfirmPasswordLabel,
                    controller: confirmPasswordController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StoreTextFoundation.createAccountConfirmPasswordValidatorEmpty;
                      }
                      if (value != passwordController.text) {
                        return StoreTextFoundation.createAccountConfirmPasswordValidatorMismatch;
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
                          text:  TextSpan(
                            text: StoreTextFoundation.createAccountRegisterTermsPrefix,
                            style: const TextStyle(
                              color: StoreColorsFoundation.textColor,
                              fontSize: StoreTypographyFoundation.fontSizeH5,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: StoreTextFoundation.createAccountRegisterTermsButton,
                                style: const TextStyle(
                                  color: StoreColorsFoundation.primaryColor,
                                  fontWeight: StoreTypographyFoundation.fontWeightBold,
                                ),
                              ),
                              TextSpan(
                                text: StoreTextFoundation.createAccountRegisterTermsSuffix,
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
                      key: const Key('createAccountRegisterButton'),
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
