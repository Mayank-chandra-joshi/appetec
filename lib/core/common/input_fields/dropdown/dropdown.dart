import 'package:appetec/core/common/input_fields/dropdown/dropdown_list.dart';
import 'package:appetec/core/common/input_fields/dropdown/dropdown_options.dart';
import 'package:appetec/core/common/input_fields/dropdown/dropdown_trigger.dart';
import 'package:flutter/material.dart';

class Dropdown<T> extends StatelessWidget {
  final bool isOpen;
  final List<DropdownOption<T>> options;
  final String selectedLabel;
  final T selectedOption;
  final void Function(String, T) onChange;
  final String placeholder;
  final VoidCallback onToggle;
  final bool formValidationFailed;
  final String validationFailMessage;

  const Dropdown({
    super.key,
    required this.isOpen,
    required this.options,
    required this.selectedLabel,
    required this.selectedOption,
    required this.onChange,
    required this.placeholder,
    required this.onToggle,
    required this.formValidationFailed,
    required this.validationFailMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: DropdownList<T>(
            isOpen: isOpen,
            options: options,
            selectedOption: selectedOption,
            onChange: onChange,
            onToggle: onToggle,
          ),
        ),
        DropdownTrigger(
          placeholder: placeholder,
          selectedOption: selectedOption,
          selectedLabel: selectedLabel,
          isOpen: isOpen,
          onToggle: onToggle,
          formValidationFailed: formValidationFailed,
          validationFailMessage: validationFailMessage,
        ),
      ],
    );
  }
}
