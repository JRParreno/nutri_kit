// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StepperTextField extends StatelessWidget {
  const StepperTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.enabled = true,
    this.textColor,
    this.fillColor,
    this.border,
  });
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool enabled;
  final Color? textColor;
  final Color? fillColor;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      style: TextStyle(
        color:
            textColor ?? Colors.white, // Set the text color for enabled state
        fontFamily: 'Signika',
        fontSize: 17,
        fontWeight: FontWeight.normal, // Set the font weight
      ),
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: textColor ?? Colors.white,
      decoration: InputDecoration(
        fillColor: fillColor,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        hintText: hintText,
        hintStyle: TextStyle(
          color: textColor,
        ),
        border: border,
        disabledBorder: border,
        enabledBorder: border,
        focusedBorder: border,
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
