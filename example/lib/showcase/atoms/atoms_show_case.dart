import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:store_desing_system/store_desing_system.dart';

class AtomShowCase extends StatelessWidget {
  const AtomShowCase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atom Showcase'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('ButtonAtom Examples'),
            _buildButtonAtomExamples(),
            const SizedBox(height: StoreSpacingFoundation.md),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            const SizedBox(height: StoreSpacingFoundation.md),
            _buildSectionTitle('FilterButtonAtom Example'),
            _buildFilterButtonAtomExample(),
            const SizedBox(height: StoreSpacingFoundation.md),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            const SizedBox(height: StoreSpacingFoundation.md),
            _buildSectionTitle('ImageAtom Examples'),
            _buildImageAtomExamples(),
            _buildSectionTitle('InputAtom Examples'),
            _buildInputAtomExamples(),
            const SizedBox(height: StoreSpacingFoundation.md),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            const SizedBox(height: StoreSpacingFoundation.md),
            _buildSectionTitle('SortButtonAtom Examples'),
            _buildSortButtonAtomExamples(),
            const SizedBox(height: StoreSpacingFoundation.md),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            const SizedBox(height: StoreSpacingFoundation.md),
            _buildSectionTitle('StarAtom Examples'),
            _buildStarAtomExamples(),
            const SizedBox(height: StoreSpacingFoundation.md),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            const SizedBox(height: StoreSpacingFoundation.md),
            _buildSectionTitle('TextAreaAtom Examples'),
            _buildTextAreaAtomExamples(),
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

  Widget _buildButtonAtomExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildButtonAtomExample(
          label: 'Default Button',
          onPressed: () {},
        ),
        const SizedBox(height: StoreSpacingFoundation.lg),
        _buildButtonAtomExample(
          label: 'Change Size',
          onPressed: () {},
          size: const Size(100, 80),
        ),
        const SizedBox(height: StoreSpacingFoundation.lg),
        _buildButtonAtomExample(
          label: 'Change Text Color',
          onPressed: () {},
          size: const Size(100, 50),
          textColor: StoreColorsFoundation.textColor,
        ),
        const SizedBox(height: StoreSpacingFoundation.lg),
        _buildButtonAtomExample(
          label: 'Change Background Color',
          onPressed: () {},
          backgroundColor: StoreColorsFoundation.primaryColor,
        ),
        const SizedBox(height: StoreSpacingFoundation.lg),
        _buildButtonAtomExample(
          label: 'Change Border Radius',
          onPressed: () {},
          size: const Size(300, 50),
          borderRadius: 100.0,
        ),
      ],
    );
  }

  Widget _buildButtonAtomExample({
    required String label,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? textColor,
    Size? size,
    double borderRadius = 8.0,
  }) {
    String codeSnippet = '''
ButtonAtom(
  label: "$label",
  onPressed: () { },
  ${backgroundColor != null ? 'backgroundColor: $backgroundColor,' : ''}
  ${textColor != null ? 'textColor: $textColor,' : ''}
  ${size != null ? 'size: Size(${size.width}, ${size.height}),' : ''}
  borderRadius: $borderRadius,
),
''';

    return ShowCodeExample(
      title: label,
      exampleWidget: ButtonAtom(
        label: label,
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        textColor: textColor,
        size: size,
        borderRadius: borderRadius,
      ),
      codeSnippet: codeSnippet,
    );
  }

  Widget _buildFilterButtonAtomExample() {
    String codeSnippet = '''
FilterButtonAtom(
  onTap: () { },
),
''';
    return ShowCodeExample(
      title: "",
      exampleWidget: FilterButtonAtom(
        onTap: () {},
      ),
      codeSnippet: codeSnippet,
    );
  }

  Widget _buildImageAtomExamples() {
    String codeSnippet = '''
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const SizedBox(
      width: 200,
      child: ImageAtom(
        src:"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        fit: BoxFit.cover,
      ),
    ),
    const SizedBox(height: StoreSpacingFoundation.s),
    const SizedBox(
      width: 200,
      child: ImageAtom(
        src: "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
        fit: BoxFit.contain,
      ),
    ),
  ],
)
''';
    return ShowCodeExample(
      title: "",
      exampleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            width: 200,
            child: ImageAtom(
              src: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: StoreSpacingFoundation.s),
          SizedBox(
            width: 200,
            child: ImageAtom(
              src:
                  "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      codeSnippet: codeSnippet,
    );
  }

  Widget _buildInputAtomExamples() {
    String codeSnippet = '''
Column(
  children: [
    InputAtom(
      label: 'Username',
      iconData: Icons.person,
      controller: _usernameController,
    ),
    const SizedBox(height: StoreSpacingFoundation.s),
    InputAtom(
      label: 'Password',
      iconData: Icons.lock,
      controller: _passwordController,
      isPassword: true,
    ),
  ],
),
''';

    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return ShowCodeExample(
      title: "",
      exampleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputAtom(
            label: 'Username',
            iconData: Icons.person,
            controller: _usernameController,
            onChanged: (String value) {},
          ),
          const SizedBox(height: StoreSpacingFoundation.s),
          InputAtom(
            label: 'Password',
            iconData: Icons.lock,
            controller: _passwordController,
            isPassword: true,
            onChanged: (String value) {},
          ),
        ],
      ),
      codeSnippet: codeSnippet,
    );
  }

  Widget _buildSortButtonAtomExamples() {
    String codeSnippet = '''
SortButtonAtom(
  onTap: () { },
),
''';
    return ShowCodeExample(
      title: "",
      exampleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SortButtonAtom(
            onTap: () {},
          ),
        ],
      ),
      codeSnippet: codeSnippet,
    );
  }

  Widget _buildStarAtomExamples() {
    String codeSnippet = '''
Column(
  children: [
    const StarAtom(),
    const SizedBox(height: StoreSpacingFoundation.s),
    const StarAtom(
      backgroundColor: Colors.blue,
      size: 32.0,
    ),
  ],
),
''';
    return ShowCodeExample(
      title: "",
      exampleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          StarAtom(),
          SizedBox(height: StoreSpacingFoundation.s),
          StarAtom(
            backgroundColor: Colors.blue,
            size: 32.0,
          ),
          SizedBox(height: StoreSpacingFoundation.s),
        ],
      ),
      codeSnippet: codeSnippet,
    );
  }

  Widget _buildTextAreaAtomExamples() {
    String codeSnippet = '''
Column(
  children: [
    TextAreaAtom(
      iconData: Icons.comment,
      label: 'Comment',
      controller: _commentController,
    ),
    const SizedBox(height: StoreSpacingFoundation.s),
    TextAreaAtom(
      iconData: Icons.notes,
      label: 'Notes',
      controller: _notesController,
      maxLines: 3,
    ),
  ],
),
''';

    TextEditingController _commentController = TextEditingController();
    TextEditingController _notesController = TextEditingController();
    return ShowCodeExample(
      title: "",
      exampleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextAreaAtom(
            iconData: Icons.comment,
            label: 'Comment',
            controller: _commentController,
          ),
          const SizedBox(height: StoreSpacingFoundation.s),
          TextAreaAtom(
            iconData: Icons.notes,
            label: 'Notes',
            controller: _notesController,
            maxLines: 3,
          ),
        ],
      ),
      codeSnippet: codeSnippet,
    );
  }

}
