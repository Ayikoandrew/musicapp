import 'package:client/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String data;
  final VoidCallback onPressed;
  const AuthButton({super.key, required this.data, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: const LinearGradient(
          colors: [
            Pallete.gradient2,
            Pallete.gradient3,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(550, 55),
          backgroundColor: Pallete.transparentColor,
          shadowColor: Pallete.transparentColor,
        ),
        child: Text(data),
      ),
    );
  }
}
