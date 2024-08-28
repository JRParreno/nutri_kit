// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StepperTextField extends StatelessWidget {
  const StepperTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.enabled = true,
  });
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      style: const TextStyle(
        color: Colors.white, // Set the text color for enabled state
        fontFamily: 'Signika',
        fontSize: 17,
        fontWeight: FontWeight.normal, // Set the font weight
      ),
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        hintText: hintText,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
    );
  }
}
