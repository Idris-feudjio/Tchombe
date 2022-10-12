import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.controller,
      this.hintText,
      this.keyboardType = TextInputType.text,
      this.maxLines,
      this.border,
      this.labelText,
      this.validator,
      this.onFieldSubmitted});

  final TextEditingController? controller;
  final String? hintText;
  final TextInputType keyboardType;
  final dynamic validator;
  final int? maxLines;
  final OutlineInputBorder? border;
  final String? labelText;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: border,
        labelText: labelText,
      ),
      keyboardType: keyboardType,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
