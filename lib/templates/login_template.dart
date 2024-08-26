import 'package:flutter/material.dart';
import 'package:store_design_system/foundation/text_foundation.dart';
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
  final pageName = 'login';
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
                  Text(
                    StoreTextFoundation.loginWelcome,
                    style: const TextStyle(
                        fontSize: StoreTypographyFoundation.fontSizeH1,
                        fontWeight: StoreTypographyFoundation.fontWeightBold),
                  ),
                  Text(
                    StoreTextFoundation.loginWelcomeBack,
                    style: const TextStyle(
                        fontSize: StoreTypographyFoundation.fontSizeH1,
                        fontWeight: StoreTypographyFoundation.fontWeightBold),
                  ),
                  const SizedBox(
                    height: StoreSpacingFoundation.lg,
                  ),
                  InputAtom(
                    key: const Key('loginUsernameField'),
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
                    key: const Key('loginPasswordField'),
                    iconData: Icons.lock,
                    label: StoreTextFoundation.loginPassword,
                    controller: passwordController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StoreTextFoundation.loginPasswordValidationEmpty;
                      }
                      if (value.length < 6) {
                        return StoreTextFoundation.loginPasswordValidationShort;
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
                        child: Text(
                          key: const Key('loginTextForgotPassword'),
                          StoreTextFoundation.loginForgotPassword,
                          style: const TextStyle(
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
                      key: const Key('loginOnTapLogin'),
                      label: StoreTextFoundation.loginButtonLabel,
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
                      Text(
                        StoreTextFoundation.loginCreateAccount,
                        style: const TextStyle(
                          fontSize: StoreTypographyFoundation.fontSizeH5,
                        ),
                      ),
                      GestureDetector(
                        onTap: onTapSignUp,
                        child: Text(
                          key: const Key('loginTextRegister'),
                          StoreTextFoundation.loginRegister,
                          style: const TextStyle(
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
