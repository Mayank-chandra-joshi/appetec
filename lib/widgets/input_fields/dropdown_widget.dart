import 'package:appetec/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownWidget extends StatelessWidget {
  final void Function(String?)? onChanged;
  final String? placeholder;
  final List<String> options;
  const DropdownWidget({
    super.key,
    this.placeholder,
    required this.onChanged,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButtonFormField(
        icon: const Icon(Icons.keyboard_arrow_down, color: primaryPurple),
        items: options
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                  ),
                ))
            .toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null) {
            return '';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: GoogleFonts.exo2(
          color: black,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: placeholder,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(width: 2.0, color: black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(width: 2.0, color: black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(width: 2.0, color: primaryPurple),
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
      ),
    );
  }
}
