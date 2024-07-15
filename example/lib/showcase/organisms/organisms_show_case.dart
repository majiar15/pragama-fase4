import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:store_desing_system/store_desing_system.dart';

class OrganismShowcase extends StatelessWidget {
  const OrganismShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organism Showcase'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('CardCartOrganism Example'),
            _buildCardCartOrganismExample(),
            const Divider(thickness: 2, color: Colors.black),
            _buildSectionTitle('CardOrganism Example'),
            _buildCardOrganismExample(),
            const Divider(thickness: 2, color: Colors.black),
            _buildSectionTitle('CardSmallOrganism Example'),
            _buildCardSmallOrganismExample(),
            const Divider(thickness: 2, color: Colors.black),
            _buildSectionTitle('FilterSortOrganism Example'),
            _buildFilterSortOrganismExample(),
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

  Widget _buildCardCartOrganismExample() {
    String codeSnippet = '''
CardCartOrganism(
  product: ProductCartModel(
    image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    title: 'Product Title',
    price: 19.99,
    quantity: 2,
    productId: 1,
  ),
  onIncrease: () { },
  onDecrease: () { },
),
''';
    return ShowCodeExample(
      title: "",
      exampleWidget: CardCartOrganism(
        product: ProductCartModel(
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          title: 'Product Title',
          price: 19.99,
          quantity: 2,
          productId: 1,
        ),
        onIncrease: () {},
        onDecrease: () {},
      ),
      codeSnippet: codeSnippet,
    );
  }

  Widget _buildCardOrganismExample() {
    String codeSnippet = '''
CardOrganism(
  imageUrl: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
  title: 'Product Title',
  description: 'Product Description',
  originalPrice: 29.99,
  discountPercentage: 20,
  rating: 4.5,
  reviews: 120,
  onTapCard: () { },
),
''';
    return ShowCodeExample(
      title: "",
      exampleWidget: CardOrganism(
        imageUrl: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        title: 'Product Title',
        description: 'Product Description',
        originalPrice: 29.99,
        discountPercentage: 20,
        rating: 4.5,
        reviews: 120,
        onTapCard: () {},
      ),
      codeSnippet: codeSnippet,
    );
  }

  Widget _buildCardSmallOrganismExample() {
    String codeSnippet = '''
CardSmallOrganism(
  imageUrl: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
  title: 'Product Title',
  description: 'Product Description',
  originalPrice: 29.99,
  discountPercentage: 20,
  onTapCard: () { },
),
''';
    return ShowCodeExample(
      title: "",
      exampleWidget: CardSmallOrganism(
        imageUrl: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        title: 'Product Title',
        description: 'Product Description',
        originalPrice: 29.99,
        discountPercentage: 20,
        onTapCard: () {},
      ),
      codeSnippet: codeSnippet,
    );
  }

  Widget _buildFilterSortOrganismExample() {
    String codeSnippet = '''
FilterSortOrganism(
  filterCategories: const ['Category 1', 'Category 2', 'Category 3'],
  onSortSelected: (String category) { },
  onFilterSelected: (String category) { },
),
''';
    return ShowCodeExample(
      title: "",
      exampleWidget: FilterSortOrganism(
        filterCategories: const ['Category 1', 'Category 2', 'Category 3'],
        onSortSelected: (String category) {},
        onFilterSelected: (String category) {},
      ),
      codeSnippet: codeSnippet,
    );
  }
}
