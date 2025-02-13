import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/types/Device/DeviceDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceCard extends StatelessWidget {
  final DeviceItem deviceDetails;
  const DeviceCard({super.key, required this.deviceDetails});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: white,
          shadowColor: darkGreen,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        onPressed: () {},
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                deviceDetails.name,
                style: GoogleFonts.exo(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: black,
                ),
              ),
              Text(
                deviceDetails.id,
                style: GoogleFonts.exo(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: black,
                ),
              )
            ],
          ),
        ));
  }
}
