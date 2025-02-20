import 'package:appetec/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextCheckBox extends StatelessWidget {
  bool isChecked;
  final String label;
  final String? Function(bool?)? validator;

  TextCheckBox({
    super.key,
    required this.isChecked,
    required this.label,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: isChecked,
      validator: validator,
      builder: (FormFieldState<bool> state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(-8, -10),
              child: Transform.scale(
                scale: 0.55,
                child: Checkbox(
                  value: state.value,
                  onChanged: (bool? value) {
                    state.didChange(value);
                  },
                  fillColor: WidgetStateProperty.resolveWith((states) {
                    if (!states.contains(WidgetState.selected)) {
                      return ThemeColors.white;
                    }
                    return null;
                  }),
                  side: BorderSide(
                    width: 1.5,
                    color: state.hasError
                        ? ThemeColors.redColor
                        : Colors.transparent,
                  ),
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.exo2(
                  fontSize: 12,
                  color: ThemeColors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
