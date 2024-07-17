import 'package:example/showcase/atoms/atoms_show_case.dart';
import 'package:example/showcase/foundations/foundations_show_case.dart';
import 'package:example/showcase/molecules/molecules_show_case.dart';
import 'package:example/showcase/organisms/organisms_show_case.dart';
import 'package:example/showcase/templates/template_show_case.dart';
import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';
import 'showcase/pages/pages_show_case.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: "Store Design System Demo",

      theme: ligthThemeFoundation,


      home: const ShowcaseHomePage(),
    );
  }
}


class ShowcaseHomePage extends StatelessWidget {

  const ShowcaseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Desing System'),
      ),


      body: ListView(
        children: [

          ListTile(
            title: const Text('Foundation ShowCase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FoundationShowcase()),
            ),
          ),
          ListTile(
            title: const Text('Atoms ShowCase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AtomShowCase()),
            ),
          ),


          ListTile(
            title: const Text('Molecules ShowCase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MoleculeShowCase()),
            ),
          ),


          ListTile(
            title: const Text('Organisms Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OrganismShowcase()),
            ),
          ),


          ListTile(
            title: const Text('Templates Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TemplateShowCase()),
            ),
          ),


          ListTile(
            title: const Text('Pages Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PageShowcase()),
            ),
          ),
        ],
      ),
    );
  }
}



class ShowCodeExample extends StatefulWidget {
  final String title;
  final Widget exampleWidget;
  final String codeSnippet;

  const ShowCodeExample({
    Key? key,
    required this.title,
    required this.exampleWidget,
    required this.codeSnippet,
  }) : super(key: key);

  @override
  ShowCodeExampleState createState() => ShowCodeExampleState();
}

class ShowCodeExampleState extends State<ShowCodeExample> {
  bool _isCodeVisible = false;

  void _toggleCodeVisibility() {
    setState(() {
      _isCodeVisible = !_isCodeVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        widget.exampleWidget,
        const SizedBox(height: 8),
        TextButton(
          onPressed: _toggleCodeVisibility,
          child: Text(_isCodeVisible ? 'Ocultar Código' : 'Ver Código'),
        ),
        if (_isCodeVisible) _buildCodeSnippet(widget.codeSnippet),
        const SizedBox(height: StoreSpacingFoundation.md),
      ],
    );
  }

  Widget _buildCodeSnippet(String code) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          code,
          style: const TextStyle(fontFamily: 'Courier', fontSize: 12.0),
        ),
      ),
    );
  }
}