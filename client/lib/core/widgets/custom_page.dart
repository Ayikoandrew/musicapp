import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String hintText;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomPage(
      {super.key,
      required this.controller,
      this.obscureText = false,
      required this.hintText,
      this.readOnly = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (val) {
        if (val!.trim().isEmpty) {
          return '';
        }
        return null;
      },
    );
  }
}
