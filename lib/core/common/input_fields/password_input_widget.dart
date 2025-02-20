import 'package:appetec/core/theme/colors.dart';
import 'package:flutter/material.dart';

class PasswordInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  final String? Function(String?)? validator;

  const PasswordInputWidget({
    super.key,
    required this.controller,
    this.placeholder,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      validator: validator,
      autofocus: false,
      decoration: InputDecoration(
        hintText: placeholder,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(width: 2.0, color: ThemeColors.primaryPurple),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(width: 2.0, color: ThemeColors.redColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(width: 2.0, color: ThemeColors.redColor),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
        filled: true,
        fillColor: white,
      ),
    );
  }
}
