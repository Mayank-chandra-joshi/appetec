import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoBtn extends StatelessWidget {
  final IconData logo;
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color bgcolor;
  final Color frcolor;
  final double? width;

  const LogoBtn({
    super.key,
    required this.onPressed,
    required this.logo,
    required this.text,
    required this.color,
    required this.bgcolor,
    required this.frcolor,
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
        child: Stack(
          children: [
            Align(
              alignment:
                  Alignment.centerLeft, // Aligns the icon to the center-left
              child: Icon(
                logo,
                color: color,
                size: 24,
              ),
            ),
            Align(
              alignment: Alignment.center, // Centers the text
              child: Text(
                text,
                style: GoogleFonts.exo(
                  color: color,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
