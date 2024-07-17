import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';
class SupportContactTemplate extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  SupportContactTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(StoreSizesFoundation.paddingM),
        child: SingleChildScrollView(
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
                controller: nameController, onChanged: (String value) {  },
              ),
              const SizedBox(height: StoreSpacingFoundation.md),
              InputAtom(
                iconData: Icons.email,
                label: "Correo Electrónico",
                controller: emailController, onChanged: (String value) {  },
              ),
              const SizedBox(height: StoreSpacingFoundation.md),
              InputAtom(
                iconData: Icons.subject,
                label: "Asunto",
                controller: subjectController, onChanged: (String value) {  },
              ),
              const SizedBox(height: StoreSpacingFoundation.md),
              TextAreaAtom(
                iconData: Icons.message,
                label: "Mensaje",
                controller: messageController,
                maxLines: 5,
              ),
              const SizedBox(height: StoreSpacingFoundation.lg),
              Center(
                child: ButtonAtom(
                  label: "Enviar",
                  onPressed: () => print("Enviar"),
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
                'Teléfono: +57 300 5525028',
                style: TextStyle(
                  fontSize: StoreTypographyFoundation.fontSizeH5,
                ),
              ),
              const SizedBox(height: StoreSpacingFoundation.s),
              const Text(
                'Correo Electrónico: majiar16@gmail.com',
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
      );
  }
}