// Initializing a function shows a dialog
import 'package:flutter/material.dart';

Future<void> showMyDialog(BuildContext context, String title, String content,
    VoidCallback onPressed) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      // Display the dialog
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: onPressed,
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      );
    },
  );
}
