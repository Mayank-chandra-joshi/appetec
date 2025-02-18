import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/features/onboarding/presentation/widgets/forms/add_device_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PairDevicePage extends StatelessWidget {
  final String deviceId;
  const PairDevicePage({super.key, required this.deviceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enter your device",
                      style: GoogleFonts.exo(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: black,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    AddDeviceForm(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: -20,
            child: Image.asset(
              "assets/images/Group 75@2x.png",
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: -40,
            left: -30,
            child: Image.asset(
              "assets/images/Group 75@2x.png",
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: Image.asset(
              "assets/images/Group 77.png",
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: -30,
            right: -70,
            child: Transform.rotate(
              angle: 1,
              child: Image.asset(
                "assets/images/Group 77.png",
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
