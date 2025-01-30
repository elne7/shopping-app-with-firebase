import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.hintText,
      this.obscureText = false,
      required this.validator,
      this.icon,
      required this.controller});

  final String hintText;
  final FormFieldValidator<String> validator;
  final IconButton? icon;
  final TextEditingController controller;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        label: Text(
          hintText,
          style: TextStyle(color: Colors.blue.withOpacity(0.8)),
        ),
        hintText: hintText,
        suffixIcon: icon,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
