import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.image, this.offerName});

  final String image;
  final String? offerName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect( // Wrapping the container with a ClipRRect to control its border
      borderRadius: BorderRadius.circular(16),
      child: SizedBox( // Giving the container padding space
        height: 280,
        width: MediaQuery.of(context).size.width, // Making the width of the container as the width of the device
        child: Column(
          children: [
            Image.asset(image),
            Text(
              offerName ?? '', // Making the text to show nothing when its value be null
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
