import 'package:appetec/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  final String? Function(String?)? validator;

  const NumberInputWidget({
    super.key,
    required this.controller,
    this.placeholder,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
      style: GoogleFonts.exo2(
        color: black,
        fontSize: 16,
      ),
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
          borderSide: BorderSide(width: 2.0, color: Colors.deepPurple),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(width: 2.0, color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(width: 2.0, color: Colors.red),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
        filled: true,
        fillColor: white,
      ),
    );
  }
}
