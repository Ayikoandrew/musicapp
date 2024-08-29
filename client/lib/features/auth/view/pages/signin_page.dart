import 'package:client/features/auth/view/widgets/auth_button.dart';
import 'package:client/features/auth/view/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_palette.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text('Sign In').animate(
            effects: [
              FadeEffect(duration: 500.ms),
              ScaleEffect(delay: 500.ms),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          CustomPage(
            controller: nameController,
            obscureText: false,
            onTap: () {},
            hintText: 'Name',
          ),
          const SizedBox(
            height: 15,
          ),
          CustomPage(
            controller: passwordController,
            obscureText: true,
            onTap: () {},
            hintText: 'Password',
          ),
          const SizedBox(
            height: 40,
          ),
          const AuthButton(data: 'Sign In'),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: const TextSpan(
              text: 'Not registered? ',
              children: [
                TextSpan(
                  text: 'Sign Un',
                  style: TextStyle(
                    color: Pallete.gradient2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
