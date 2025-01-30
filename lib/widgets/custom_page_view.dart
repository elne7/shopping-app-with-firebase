import 'package:flutter/material.dart';
import 'package:simple_shopping_app/widgets/custom_container.dart';

class CustomPageView extends StatelessWidget {
  CustomPageView({super.key});

  // Creating a list of the images for the page view
  final List<String> images = [
    'assets/images/PageView1.jpg',
    'assets/images/PageView2.jpg',
    'assets/images/PageView3.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox( // Wrapping the page view with a SizedBox to control its height
      height: 280,
      child: PageView.builder(
        itemCount: 3, // Creating 3 pages
        itemBuilder: (context, index) {
          return CustomContainer(image: images[index]); // Displaying a container with image
        },
      ),
    );
  }
}
