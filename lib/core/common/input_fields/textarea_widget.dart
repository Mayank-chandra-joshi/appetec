import 'package:appetec/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextAreaWidget extends StatelessWidget {
  final int maxLines;
  final TextEditingController controller;
  final String? placeholder;
  final String? Function(String?)? validator;

  const TextAreaWidget({
    super.key,
    required this.maxLines,
    required this.controller,
    required this.placeholder,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: validator,
      controller: controller,
      style: GoogleFonts.exo(
        color: ThemeColors.black,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: placeholder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(width: 2.0, color: ThemeColors.primaryPurple),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(width: 2.0, color: ThemeColors.redColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(width: 2.0, color: ThemeColors.redColor),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
        filled: true,
        fillColor: white,
      ),
    );
  }
}
