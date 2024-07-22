// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
    required this.onSearch,
    required this.hintText,
    required this.onChanged,
    required this.onClearText,
  });

  final TextEditingController controller;
  final VoidCallback onSearch;
  final String hintText;
  final VoidCallback onChanged;
  final VoidCallback onClearText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Color(0xff666666)),
      controller: controller,
      maxLines: 1,
      onEditingComplete: onSearch,
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          fontFamily: 'Signika',
          fontSize: 17,
          color: Color(0xff666666),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(
            color: Colors.white,
            width: 24,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(
            color: Colors.white,
            width: 24,
          ),
        ),
        labelStyle: const TextStyle(color: Color(0xff666666)),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        prefixIcon: const Icon(
          CupertinoIcons.search,
        ),
        prefixIconColor: const Color(0xff666666),
        suffixIcon: controller.text.isNotEmpty
            ? GestureDetector(
                onTap: onClearText,
                child: const Icon(
                  Icons.clear,
                ),
              )
            : null,
        suffixIconColor: Colors.red,
      ),
      onChanged: (value) {
        EasyDebounce.debounce(
            'search-on-change', // <-- An ID for this particular debouncer
            const Duration(milliseconds: 500), // <-- The debounce duration
            () => onChanged() // <-- The target method
            );
      },
    );
  }
}
