import 'package:appetec/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownWidget3 extends StatefulWidget {
  final String selectedOption;
  final void Function(String?)? onChanged;
  final String placeholder;
  final List<String> options;

  const DropdownWidget3({
    super.key,
    required this.placeholder,
    required this.onChanged,
    required this.options,
    required this.selectedOption,
  });

  @override
  DropdownWidget3State createState() {
    return DropdownWidget3State();
  }
}

class DropdownWidget3State extends State<DropdownWidget3> {
  final MenuController _menuController = MenuController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      MenuAnchor(
        controller: _menuController,
        alignmentOffset: const Offset(0, 5),
        style: MenuStyle(
          // minimumSize: WidgetStateProperty.all(
          //   Size(0, 45 * widget.options.length + 45),
          // ),
          backgroundColor: WidgetStateProperty.all(white),
        ),
        menuChildren: widget.options.map((value) {
          return SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            child: MenuItemButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                ),
              ),
              onPressed: () {
                widget.onChanged?.call(value);
                _menuController.close();
              },
              child: Text(
                value,
                style: GoogleFonts.exo(
                  color: black,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }).toList(),
        builder: (context, controller, child) {
          return SizedBox(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: BorderSide(
                    color: controller.isOpen ? primaryPurple : black,
                    width: 2,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                backgroundColor: white,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.selectedOption.isEmpty
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
          );
        },
      )
    ]);
  }
}
