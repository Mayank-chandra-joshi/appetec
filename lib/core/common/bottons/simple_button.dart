import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color bgcolor;
  final Color? frcolor;
  final double? width;

  const SimpleBtn({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.bgcolor,
    this.frcolor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgcolor,
          foregroundColor: frcolor,
        ),
        child: Text(
          text,
          style: GoogleFonts.exo(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
