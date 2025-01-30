import 'package:flutter/material.dart';
import 'package:simple_shopping_app/widgets/custom_card.dart';

class CustomGridView extends StatelessWidget {
  CustomGridView({super.key});

  // Creating the list of offers images for the GridView
  final List<Map<String, String>> products = [
    {"image": "assets/images/Camera.jpg", "productName": "Camera"},
    {"image": "assets/images/Earpods.jpg", "productName": "Earpods"},
    {
      "image": "assets/images/ExternalDesk.jpg",
      "productName": "External\nHardDesk"
    },
    {"image": "assets/images/IPhone.jpg", "productName": "IPhone"},
    {"image": "assets/images/Microphone.jpg", "productName": "Micro\nphone"},
    {"image": "assets/images/Headphone.jpg", "productName": "Head\nphone"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox( // Wrapping the GridView with a SizedBox to control its height
      height: 300,
      child: Padding( // Giving each product padding space
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: GridView.builder(
          itemCount: 6, // Creating 6 cards for each product
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 15,
            mainAxisSpacing: 40,
          ),
          // Displaying the products cards
          itemBuilder: (context, index) => CustomCard(
            image: products[index]['image']!,
            productName: products[index]['productName']!,
          ),
        ),
      ),
    );
  }
}
