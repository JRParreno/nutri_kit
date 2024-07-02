import 'package:flutter/material.dart';
import 'package:nutri_kit/features/auth/presentation/widgets/auth_field.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/gen/colors.gen.dart';
import 'package:nutri_kit/main.dart';
import 'package:nutri_kit/router/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Assets.images.auth.login.image(),
              AuthField(
                controller: emailCtrl,
                hintText: 'Email',
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
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Login',
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
                  router.pushNamed(AppRoutes.signup.name);
                },
                child: RichText(
                  text: const TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: "Register",
                        style: TextStyle(color: ColorName.link),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
