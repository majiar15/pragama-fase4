import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:store_design_system/foundation/text_foundation.dart';

class SupportContactTemplate extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  SupportContactTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(StoreSizesFoundation.paddingM),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StoreTextFoundation.supportContactTitle,
                  style: const TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH2,
                    fontWeight: StoreTypographyFoundation.fontWeightBold,
                  ),
                ),
                const SizedBox(height: StoreSpacingFoundation.lg),
                InputAtom(
                  key: const Key("supportContactNameInput"),
                  iconData: Icons.person,
                  label: StoreTextFoundation.supportContactNameLabel,
                  controller: nameController,
                  onChanged: (String value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StoreTextFoundation.supportContactNameValidator;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: StoreSpacingFoundation.md),
                InputAtom(
                  key: const Key("supportContactEmailInput"),
                  iconData: Icons.email,
                  label: StoreTextFoundation.supportContactEmailLabel,
                  controller: emailController,
                  onChanged: (String value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StoreTextFoundation.supportContactEmailValidatorEmpty;
                    }
                    String pattern =
                        r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return StoreTextFoundation.supportContactEmailValidatorInvalid;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: StoreSpacingFoundation.md),
                InputAtom(
                  key: const Key("supportContactSuBjectInput"),

                  iconData: Icons.subject,
                  label: StoreTextFoundation.supportContactSubjectLabel,
                  controller: subjectController,
                  onChanged: (String value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StoreTextFoundation.supportContactSubjectValidator;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: StoreSpacingFoundation.md),
                TextAreaAtom(
                  key: const Key("supportContactMessageInput"),
                  iconData: Icons.message,
                  label: StoreTextFoundation.supportContactMessageLabel,
                  controller: messageController,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StoreTextFoundation.supportContactMessageValidator;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: StoreSpacingFoundation.lg),
                Center(
                  child: ButtonAtom(
                    key: const Key("supportContactButtonSend"),
                    label: StoreTextFoundation.supportContactSendButton,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        DialogAtom(
                          title: StoreTextFoundation.supportContactDialogTitle,
                          content: StoreTextFoundation.supportContactDialogContent,
                          rightButtonText: StoreTextFoundation.supportContactDialogCloseButton,
                          onRightButtonPressed: () {
                            nameController.text = "";
                            emailController.text = "";
                            subjectController.text = "";
                            messageController.text = "";
                            Navigator.pop(context);
                          },
                        ).show(context);
                      }
                    },
                  ),
                ),
                const SizedBox(height: StoreSpacingFoundation.xl),
                const Divider(),
                const SizedBox(height: StoreSpacingFoundation.lg),
                Text(
                  StoreTextFoundation.supportContactContactInformation,
                  style: const TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH2,
                    fontWeight: StoreTypographyFoundation.fontWeightBold,
                  ),
                ),
                const SizedBox(height: StoreSpacingFoundation.md),
                Text(
                  StoreTextFoundation.supportContactPhone,
                  style: const TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH5,
                  ),
                ),
                const SizedBox(height: StoreSpacingFoundation.s),
                Text(
                  StoreTextFoundation.supportContactEmail,
                  style: const TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH5,
                  ),
                ),
                const SizedBox(height: StoreSpacingFoundation.s),
                Text(
                  StoreTextFoundation.supportContactAddress,
                  style: const TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH5,
                  ),
                ),
                const SizedBox(height: StoreSpacingFoundation.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
