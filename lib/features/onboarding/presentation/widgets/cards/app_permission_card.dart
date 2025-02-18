import 'package:appetec/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppPermissionCard extends StatelessWidget {
  final String image, title, desc;
  final bool value;
  final void Function(bool)? setValue;

  const AppPermissionCard(
      {super.key,
      required this.image,
      required this.desc,
      required this.title,
      required this.value,
      required this.setValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        spacing: 16,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: black, width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              image,
              width: 45,
              height: 45,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  title,
                  style: GoogleFonts.exo(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  desc,
                  style: GoogleFonts.exo(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Transform.scale(
              scaleX: 1.05,
              child: Switch(
                value: value,
                onChanged: setValue,
                activeColor: darkGreen,
                inactiveTrackColor: Colors.transparent,
                activeTrackColor: lightGreen,
                trackOutlineColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return darkGreen; // Color when the switch is on
                  }
                  return Colors.grey;
                }),
              ))
        ],
      ),
    );
  }
}
