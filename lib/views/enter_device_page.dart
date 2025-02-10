import 'package:flutter/material.dart';

class EnterDevicePage extends StatelessWidget {
  const EnterDevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Expanded(
            child: Center(),
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
