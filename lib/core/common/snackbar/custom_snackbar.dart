import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

customSnackbar(
    BuildContext context, String message, Color bgColor, Color textColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: bgColor,
      content: Text(
        message,
        style: GoogleFonts.exo(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    ),
  );
}
