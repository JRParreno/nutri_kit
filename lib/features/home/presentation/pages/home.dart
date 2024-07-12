import 'package:flutter/material.dart';
import 'package:nutri_kit/features/home/presentation/widgets/user_information.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
              children: [
                UserInformation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
