import 'package:appetec/core/common/input_fields/dropdown/dropdown_options.dart';
import 'package:appetec/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownList<T> extends StatelessWidget {
  final bool isOpen;
  final List<DropdownOption<T>> options;
  final T selectedOption;
  final void Function(String, T) onChange;
  final VoidCallback onToggle;

  const DropdownList({
    super.key,
    required this.isOpen,
    required this.options,
    required this.selectedOption,
    required this.onChange,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 35.0),
      decoration: BoxDecoration(
        color: selectedOption == options[0].value ? lightPurple : white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: primaryPurple,
          width: 2.0,
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: isOpen ? (options.length * 48.0) : 0,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: options
                  .map(
                    (option) => AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: isOpen ? 1.0 : 0.0, // Fade effect
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          maximumSize: const Size(double.infinity, 48),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          backgroundColor: selectedOption == option.value
                              ? lightPurple
                              : white,
                        ),
                        onPressed: () {
                          onChange(option.label, option.value);
                          onToggle();
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: Text(
                              option.label,
                              style: GoogleFonts.exo(
                                fontSize: 14,
                                color: black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
