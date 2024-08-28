import 'package:client/features/auth/view/widgets/auth_button.dart';
import 'package:client/features/auth/view/widgets/custom_page.dart';
import 'package:flutter/material.dart';

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
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomPage(
                  hintText: 'Name',
                  controller: nameController,
                  obscureText: false,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomPage(
                  hintText: 'Email',
                  controller: emailControler,
                  obscureText: false,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomPage(
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: true,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
                const AuthButton(
                  data: 'Sign Up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}