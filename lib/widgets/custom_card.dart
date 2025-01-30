import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.image, required this.productName});

  final String image;
  final String productName;

  // Making a card as a container with some edits
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      // Giving the container some decorations
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        // Giving each card a shadow
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.none,
      // Building the card content
      child: Row(
        children: [
          Image.asset(
            image,
            height: 110,
          ),
          const SizedBox(
            width: 18,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Creating a text with a fixed size
              AutoSizeText(
                productName,
                style: const TextStyle(fontSize: 16),
                minFontSize: 14,
                overflow: TextOverflow.ellipsis,
              ),
              IconButton(
                // Making the icon to show a message when pressing on it
                onPressed: () {
                  const snackBar = SnackBar(
                    content: Text('Item added to the cart'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(Icons.add_shopping_cart),
              )
            ],
          )
        ],
      ),
    );
  }
}
