import 'package:appetec/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownWidget2 extends StatefulWidget {
  final String selectedOption;
  final void Function(String?)? onChanged;
  final String placeholder;
  final List<String> options;

  const DropdownWidget2({
    super.key,
    required this.placeholder,
    required this.onChanged,
    required this.options,
    required this.selectedOption,
  });

  @override
  DropdownWidget2State createState() {
    return DropdownWidget2State();
  }
}

class DropdownWidget2State extends State<DropdownWidget2> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PortalTarget(
          visible: isActive,
          anchor: const Aligned(
            follower: Alignment.bottomCenter,
            target: Alignment.topCenter,
          ),
          portalFollower: Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: widget.options.map((value) {
                    return InkWell(
                      onTap: () {
                        widget.onChanged?.call(value);
                        setState(() {
                          isActive = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: BorderSide(
                      color: isActive ? Colors.deepPurple : black, width: 2),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                backgroundColor: white,
              ),
              onPressed: () {
                setState(() {
                  isActive = !isActive;
                });
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.selectedOption == ""
                      ? widget.placeholder
                      : widget.selectedOption,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.exo(
                    color: black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
