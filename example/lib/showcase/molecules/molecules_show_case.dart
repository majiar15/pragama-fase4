import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:store_desing_system/store_desing_system.dart';

class MoleculeShowCase extends StatelessWidget {
  const MoleculeShowCase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Molecule Showcase'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('AppBarBarMolecule Example'),
            _buildAppBarBarMoleculeExample(),


            const SizedBox(height: StoreSpacingFoundation.md),
            const Divider(thickness: 2, color: Colors.black,),
            const SizedBox(height: StoreSpacingFoundation.md),


            
            _buildSectionTitle('BannerTrendingProductsMolecule Example'),
            _buildBannerTrendingProductsMoleculeExample(),
            

            const SizedBox(height: StoreSpacingFoundation.md),
            const Divider(thickness: 2, color: Colors.black,),
            const SizedBox(height: StoreSpacingFoundation.md),
            

            _buildSectionTitle('FilterMenuMolecule Example'),
            _buildFilterMenuMoleculeExample(),
            

            const SizedBox(height: StoreSpacingFoundation.md),
            const Divider(thickness: 2, color: Colors.black,),
            const SizedBox(height: StoreSpacingFoundation.md),
            

            _buildSectionTitle('ListStarMolecule Example'),
            _buildListStarMoleculeExample(),
            

            const SizedBox(height: StoreSpacingFoundation.md),
            const Divider(thickness: 2, color: Colors.black,),
            const SizedBox(height: StoreSpacingFoundation.md),
            

            _buildSectionTitle('BottomNavigationBarMolecule Example'),
            _buildBottomNavigationBarMoleculeExample(),
            

            const SizedBox(height: StoreSpacingFoundation.md),
            const Divider(thickness: 2, color: Colors.black,),
            const SizedBox(height: StoreSpacingFoundation.md),
            

            _buildSectionTitle('SortMenuMolecule Example'),
            _buildSortMenuMoleculeExample(),
            
            

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

  Widget _buildAppBarBarMoleculeExample() {
    String codeSnippet = '''
AppBarBarMolecule(
  title: Text(
    'MY CLOTHING STORE',
    style: TextStyle(
      color: StoreColorsFoundation.textColor,
      fontSize: StoreTypographyFoundation.fontSizeH3,
    ),
  ),
),
''';
    return ShowCodeExample(
      title: "",
      exampleWidget: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        AppBarBarMolecule(
          title: Text(
            'MY CLOTHING STORE',
            style: TextStyle(
              color: StoreColorsFoundation.textColor,
              fontSize: StoreTypographyFoundation.fontSizeH3,
            ),
          ),
        ),
      ],
    ),
      codeSnippet: codeSnippet,
    );
  }

  Widget _buildBannerTrendingProductsMoleculeExample() {
    String codeSnippet = '''
BannerTrendingProductsMolecule(
  date: '2024-07-15',
  onTapButon: () { },
),
''';
 return ShowCodeExample(
      title: "",
      exampleWidget:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BannerTrendingProductsMolecule(
          date: '2024-07-15',
          onTapButon: () { },
        ),
      ],
    ),
      codeSnippet: codeSnippet,
    );
  }

  Widget _buildFilterMenuMoleculeExample() {
    List<String> filterCategories = ['Category 1', 'Category 2', 'Category 3'];
    String codeSnippet = '''
FilterMenuMolecule(
  filterCategories: $filterCategories,
  onFilterSelected: (String category) { }
),
''';
 return ShowCodeExample(
      title: "",
      exampleWidget: FilterMenuMolecule(
        filterCategories: filterCategories,
        onFilterSelected: (String category) { },
      ),
      codeSnippet: codeSnippet,
    );
  }

  Widget _buildListStarMoleculeExample() {
    String codeSnippet = '''
const ListStarMolecule(
  backgroundActiveColor: Colors.yellow,
  backgroundDisableColor: Colors.grey,
  items: 5,
  rating: 3.5,
),
''';
 return ShowCodeExample(
      title: "",
      exampleWidget:const ListStarMolecule(
        backgroundActiveColor: Colors.yellow,
        backgroundDisableColor: Colors.grey,
        items: 5,
        rating: 3.5,
      ),
      codeSnippet: codeSnippet,
    );
  }

  Widget _buildBottomNavigationBarMoleculeExample() {
    List<NavigationItemAtom> items = [
      const NavigationItemAtom(icon: Icons.home, label: 'Home'),
      const NavigationItemAtom(icon: Icons.person, label: 'Profile'),
    ];
    String codeSnippet = '''
BottomNavigationBarMolecule(
  items: [
      const NavigationItemAtom(icon: Icons.home, label: 'Home'),
      const NavigationItemAtom(icon: Icons.person, label: 'Profile'),
    ],
  currentIndex: 0,
  onTap: (index) { },
),
''';
 return ShowCodeExample(
      title: "",
      exampleWidget:BottomNavigationBarMolecule(
        items: items,
        currentIndex: 0,
        onTap: (index) { },
      ),
      codeSnippet: codeSnippet,
    );
  }

  Widget _buildSortMenuMoleculeExample() {
    List<String> properties = ['title', 'price', 'reviews'];
    String codeSnippet = '''
SortMenuMolecule(
  properties: ['title', 'price', 'reviews'],
  onSortSelected: (String property) { },
),
''';
 return ShowCodeExample(
      title: "",
      exampleWidget:SortMenuMolecule(
        properties: properties,
        onSortSelected: (String property) {  },
      ),
      codeSnippet: codeSnippet,
    );
  }

}