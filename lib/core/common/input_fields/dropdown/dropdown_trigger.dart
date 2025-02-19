import 'package:appetec/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownTrigger extends StatelessWidget {
  final String selectedLabel;
  final dynamic selectedOption;
  final String placeholder;
  final bool isOpen;
  final VoidCallback onToggle;
  final bool formValidationFailed;
  final String validationFailMessage;

  const DropdownTrigger({
    super.key,
    required this.selectedLabel,
    required this.selectedOption,
    required this.placeholder,
    required this.isOpen,
    required this.onToggle,
    required this.formValidationFailed,
    required this.validationFailMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(
                  color: formValidationFailed &&
                          (selectedOption == null ||
                              selectedOption.toString().isEmpty)
                      ? redColor
                      : (isOpen ? primaryPurple : black),
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 20),
              backgroundColor: white,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: onToggle,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned(
                    right: 0,
                    child: Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 24,
                      color: isOpen ? ThemeColors.primaryPurple : black,
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    (selectedLabel.toString().isEmpty)
                        ? placeholder
                        : selectedLabel.toString(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.exo(
                      color: black,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        // formValidationFailed && selectedOption.isEmpty
        //     ? Container(
        //         alignment: Alignment.centerLeft,
        //         padding: EdgeInsets.symmetric(horizontal: 16),
        //         child: Text(
        //           validationFailMessage,
        //           style: GoogleFonts.exo(
        //             fontSize: 12,
        //             color: Colors.red,
        //           ),
        //         ),
        //       )
        //     : const SizedBox()
      ],
    );
  }
}
