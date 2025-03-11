import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      child: Text(
        tr('submit'),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
