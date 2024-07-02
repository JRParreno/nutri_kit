import 'package:flutter/material.dart';
import 'package:nutri_kit/features/auth/presentation/widgets/auth_field.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/gen/colors.gen.dart';
import 'package:nutri_kit/main.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({super.key});

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            children: [
              Assets.images.auth.signup.image(),
              AuthField(
                controller: emailCtrl,
                hintText: 'Email',
              ),
              const SizedBox(
                height: 26,
              ),
              AuthField(
                controller: firstNameCtrl,
                hintText: 'Firstname',
              ),
              const SizedBox(
                height: 26,
              ),
              AuthField(
                controller: lastNameCtrl,
                hintText: 'Lastname',
              ),
              const SizedBox(
                height: 26,
              ),
              AuthField(
                controller: passwordCtrl,
                hintText: 'Password',
              ),
              const SizedBox(
                height: 26,
              ),
              AuthField(
                controller: confirmPasswordCtrl,
                hintText: 'Confirm Password',
              ),
              const SizedBox(
                height: 26,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Signup',
                  style: TextStyle(
                    fontFamily: 'Signika',
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              GestureDetector(
                onTap: () {
                  router.pop();
                },
                child: RichText(
                  text: const TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(color: ColorName.link),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
