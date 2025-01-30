import 'package:flutter/material.dart';
import 'package:simple_shopping_app/widgets/custom_container.dart';

class CustomListView extends StatelessWidget {
  CustomListView({super.key});

  // Creating the list of offers images for the list view 
  final List<String> offers = [
    'assets/images/Offer1.jpg',
    'assets/images/Offer2.jpg',
    'assets/images/Offer3.jpg',
    'assets/images/Offer4.jpg',
    'assets/images/Offer5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox( // Wrapping the ListView with a SizedBox to control its height
      height: 600,
      child: ListView.builder(
        itemCount: offers.length, // Making the ListView items number as the offers list number 
        itemBuilder: (context, index) {
          return Padding( // Giving each offer padding space
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CustomContainer( // Displaying a container with the offer image and name
              image: offers[index],
              offerName: 'Offer ${index + 1}',
            ),
          );
        },
      ),
    );
  }
}
