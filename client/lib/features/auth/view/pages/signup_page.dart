import 'package:client/features/auth/repositories/auth_remote_repository.dart';
import 'package:client/features/auth/view/pages/signin_page.dart';
import 'package:client/features/auth/view/widgets/auth_button.dart';
import 'package:client/features/auth/view/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/theme/app_palette.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailControler.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ).animate(
                  effects: [
                    FadeEffect(duration: 500.ms),
                    ScaleEffect(delay: 500.ms),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomPage(
                  hintText: 'Name',
                  controller: nameController,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomPage(
                  hintText: 'Email',
                  controller: emailControler,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomPage(
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                AuthButton(
                  data: 'Sign Up',
                  onPressed: () async {
                    final res = await AuthRemoteRepository().signup(
                      name: nameController.text,
                      email: emailControler.text,
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
                      text: 'Already registered? ',
                      children: [
                        TextSpan(
                          text: 'Sign In',
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
      ),
    );
  }
}
