import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/features/onboarding/domain/entities/device.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceCard extends StatelessWidget {
  final Device deviceDetails;
  final bool isSelected;
  final void Function(String, String) selectDevice;

  const DeviceCard({
    super.key,
    required this.deviceDetails,
    required this.isSelected,
    required this.selectDevice,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: white,
          shadowColor: darkGreen,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(
              color: primaryPurple,
              width: isSelected ? 4 : 2,
            ),
          ),
        ),
        onPressed: () =>
            selectDevice(deviceDetails.id, deviceDetails.thumbnailUrl),
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
              deviceDetails.version.toString(),
              style: GoogleFonts.exo(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
