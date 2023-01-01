import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? errorString;
  final Function(String) onChanged;
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      this.errorString,
      this.textInputAction,
      this.keyboardType,
      required this.onChanged,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorString,
        prefixIcon: Icon(
          prefixIcon ?? Icons.search,
          color: Colors.white70,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
      textInputAction: textInputAction ?? TextInputAction.search,
      keyboardType: keyboardType,
      cursorColor: Colors.white,
    );
  }
}
