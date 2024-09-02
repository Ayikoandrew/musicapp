import 'package:client/features/auth/repositories/auth_remote_repository.dart';
import 'package:client/features/auth/view/widgets/auth_button.dart';
import 'package:client/features/auth/view/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/theme/app_palette.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ).animate(
                effects: [
                  FadeEffect(duration: 500.ms),
                  ScaleEffect(delay: 500.ms),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomPage(
                controller: emailController,
                obscureText: false,
                hintText: 'Email',
              ),
              const SizedBox(
                height: 15,
              ),
              CustomPage(
                controller: passwordController,
                obscureText: true,
                hintText: 'Password',
              ),
              const SizedBox(
                height: 40,
              ),
              AuthButton(
                data: 'Sign In',
                onPressed: () async {
                  final res = await AuthRemoteRepository().login(
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  // ignore: unused_local_variable
                  final val = switch (res) {
                    Left(value: final l) => l,
                    Right(value: final r) => r.toString(),
                  };
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SigninPage(),
                    ),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Not registered? ',
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: Pallete.gradient2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
