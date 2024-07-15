import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:store_desing_system/store_desing_system.dart';

class FoundationShowcase extends StatelessWidget {
  const FoundationShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foundation Showcase'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Colors Foundation'),
            _buildColorsFoundationExamples(),
            const SizedBox(height: StoreSpacingFoundation.md),
            const Divider(thickness: 2, color: Colors.black),
            const SizedBox(height: StoreSpacingFoundation.md),
            _buildSectionTitle('Sizes Foundation'),
            _buildSizesFoundationExamples(),
            const SizedBox(height: StoreSpacingFoundation.md),
            const Divider(thickness: 2, color: Colors.black),
            const SizedBox(height: StoreSpacingFoundation.md),
            _buildSectionTitle('Spacing Foundation'),
            _buildSpacingFoundationExamples(),
            const SizedBox(height: StoreSpacingFoundation.md),
            const Divider(thickness: 2, color: Colors.black),
            const SizedBox(height: StoreSpacingFoundation.md),
            _buildSectionTitle('Typography Foundation'),
            _buildTypographyFoundationExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildColorsFoundationExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildColorExample(
            'Primary Color', StoreColorsFoundation.primaryColor, """
Container(
  width: 50,
  height: 50,
  color: StoreColorsFoundation.primaryColor,
),
"""),
        _buildColorExample(
            'Secondary Color', StoreColorsFoundation.secondaryColor, """
Container(
  width: 50,
  height: 50,
  color: StoreColorsFoundation.secondaryColor,
),
"""),
        _buildColorExample(
            'Background Color', StoreColorsFoundation.backgroundColor, """
Container(
  width: 50,
  height: 50,
  color: StoreColorsFoundation.backgroundColor,
),
"""),
        _buildColorExample('Error Color', StoreColorsFoundation.errorColor, """
Container(
  width: 50,
  height: 50,
  color: StoreColorsFoundation.errorColor,
),
"""),
        _buildColorExample(
            'Success Color', StoreColorsFoundation.successColor, """
Container(
  width: 50,
  height: 50,
  color: StoreColorsFoundation.successColor,
),
"""),
      ],
    );
  }

  Widget _buildSizesFoundationExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSizeExample(
            'Padding Small', StoreSizesFoundation.paddingS, """Container(
        width: StoreSizesFoundation.paddingS,
        height: 20,
        color: Colors.grey,
      )"""),
        _buildSizeExample(
            'Padding Medium', StoreSizesFoundation.paddingM, """Container(
        width: StoreSizesFoundation.paddingM,
        height: 20,
        color: Colors.grey,
      )"""),
        _buildSizeExample(
            'Padding Large', StoreSizesFoundation.paddingL, """Container(
        width: StoreSizesFoundation.paddingL,
        height: 20,
        color: Colors.grey,
      )"""),
        _buildSizeExample(
            'Height Small', StoreSizesFoundation.heightS, """Container(
        width: StoreSizesFoundation.heightS,
        height: 20,
        color: Colors.grey,
      )"""),
        _buildSizeExample(
            'Width Medium', StoreSizesFoundation.widthM, """Container(
        width: StoreSizesFoundation.widthM,
        height: 20,
        color: Colors.grey,
      )"""),
      ],
    );
  }

  Widget _buildSpacingFoundationExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSpacingExample(
            'Spacing XXS', StoreSpacingFoundation.xxs, """Container(
        width: StoreSpacingFoundation.xxs,
        height: 20,
        color: Colors.grey,
      )"""),
        _buildSpacingExample(
            'Spacing XS', StoreSpacingFoundation.xs, """Container(
        width: StoreSpacingFoundation.xs,
        height: 20,
        color: Colors.grey,
      )"""),
        _buildSpacingExample(
            'Spacing S', StoreSpacingFoundation.s, """Container(
        width: StoreSpacingFoundation.s,
        height: 20,
        color: Colors.grey,
      )"""),
        _buildSpacingExample(
            'Spacing M', StoreSpacingFoundation.md, """Container(
        width: StoreSpacingFoundation.md,
        height: 20,
        color: Colors.grey,
      )"""),
        _buildSpacingExample(
            'Spacing L', StoreSpacingFoundation.lg, """Container(
        width: StoreSpacingFoundation.lg,
        height: 20,
        color: Colors.grey,
      )"""),
      ],
    );
  }

  Widget _buildTypographyFoundationExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTypographyExample(
            'Heading 1',
            StoreTypographyFoundation.fontSizeH1,
            StoreTypographyFoundation.fontWeightBold, """
Text(
  "Heading 1",
  style: TextStyle(
    fontSize: StoreTypographyFoundation.fontSizeH1,
    fontWeight: StoreTypographyFoundation.fontWeightBold
  ),
)"""),
        _buildTypographyExample(
            'Heading 2',
            StoreTypographyFoundation.fontSizeH2,
            StoreTypographyFoundation.fontWeightMedium,"""
Text(
  "Heading 2",
  style: TextStyle(
    fontSize: StoreTypographyFoundation.fontSizeH2,
    fontWeight: StoreTypographyFoundation.fontWeightMedium
  ),
)"""),
        _buildTypographyExample(
            'Body Text',
            StoreTypographyFoundation.fontSizeBodyText,
            StoreTypographyFoundation.fontWeightRegular,"""
Text(
  "Body Text",
  style: TextStyle(
    fontSize: StoreTypographyFoundation.fontSizeBodyText,
    fontWeight: StoreTypographyFoundation.fontWeightRegular
  ),
)"""),
        _buildTypographyExample(
            'Label',
            StoreTypographyFoundation.fontSizeLabel,
            StoreTypographyFoundation.fontWeightLight, """
Text(
  "Label",
  style: TextStyle(
    fontSize: StoreTypographyFoundation.fontSizeLabel,
    fontWeight: StoreTypographyFoundation.fontWeightLight
  ),
)"""),
      ],
    );
  }

  Widget _buildColorExample(String name, Color color, String showCaseCode) {
    return ShowCodeExample(
      title: name,
      exampleWidget: Container(
        width: 50,
        height: 50,
        color: color,
      ),
      codeSnippet: showCaseCode,
    );
  }

  Widget _buildSizeExample(String name, double size, String showCaseCode) {
    return ShowCodeExample(
      title: name,
      exampleWidget: Container(
        width: size,
        height: 20,
        color: Colors.grey,
      ),
      codeSnippet: showCaseCode,
    );
  }

  Widget _buildSpacingExample(
      String name, double spacing, String showCaseCode) {
    return ShowCodeExample(
      title: name,
      exampleWidget: Container(
        width: spacing,
        height: 20,
        color: Colors.blue,
      ),
      codeSnippet: showCaseCode,
    );
  }

  Widget _buildTypographyExample(
      String name, double size, FontWeight weight, codeShowCase) {
    return ShowCodeExample(
      title: name,
      exampleWidget: Text(
        name,
        style: TextStyle(fontSize: size, fontWeight: weight),
      ),
      codeSnippet: codeShowCase,
    );
  }
}
