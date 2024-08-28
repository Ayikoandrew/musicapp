import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onTap;
  final String hintText;

  const CustomPage({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.onTap,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      onTap: onTap,
      validator: (val) {
        if (val!.trim().isEmpty) {
          return '';
        }
        return null;
      },
    );
  }
}
