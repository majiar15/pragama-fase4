import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';

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
                const Text(
                  'Ponte en contacto con nosotros',
                  style: TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH2,
                    fontWeight: StoreTypographyFoundation.fontWeightBold,
                  ),
                ),
                const SizedBox(height: StoreSpacingFoundation.lg),
                InputAtom(
                  iconData: Icons.person,
                  label: "Nombre",
                  controller: nameController,
                  onChanged: (String value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: StoreSpacingFoundation.md),
                InputAtom(
                  iconData: Icons.email,
                  label: "Correo Electrónico",
                  controller: emailController,
                  onChanged: (String value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su correo electrónico';
                    }
                    String pattern =
                        r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Por favor ingrese un correo electrónico válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: StoreSpacingFoundation.md),
                InputAtom(
                  iconData: Icons.subject,
                  label: "Asunto",
                  controller: subjectController,
                  onChanged: (String value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un asunto';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: StoreSpacingFoundation.md),
                TextAreaAtom(
                  iconData: Icons.message,
                  label: "Mensaje",
                  controller: messageController,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un mensaje';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: StoreSpacingFoundation.lg),
                Center(
                  child: ButtonAtom(
                    label: "Enviar",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        DialogAtom(
                          title: "Contacto",
                          content: "Se ha enviado un correo con su mensaje",
                          rightButtonText: "Cerrar",
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
                const Text(
                  'Información de Contacto',
                  style: TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH2,
                    fontWeight: StoreTypographyFoundation.fontWeightBold,
                  ),
                ),
                const SizedBox(height: StoreSpacingFoundation.md),
                const Text(
                  'Teléfono: +57 300 5524028',
                  style: TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH5,
                  ),
                ),
                const SizedBox(height: StoreSpacingFoundation.s),
                const Text(
                  'Correo Electrónico: majiar11@gmail.com',
                  style: TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH5,
                  ),
                ),
                const SizedBox(height: StoreSpacingFoundation.s),
                const Text(
                  'Dirección: Kra 35 # 24 - 133, Barranquilla, Colombia',
                  style: TextStyle(
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
