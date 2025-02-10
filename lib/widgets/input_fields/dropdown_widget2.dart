import 'package:appetec/constants/colors.dart';
import 'package:flutter/material.dart';
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
  final MenuController _menuController = MenuController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 47,
          decoration: BoxDecoration(
            color: white,
            border: Border(
              top: BorderSide(
                color: black,
                style: BorderStyle.solid,
                width: 2,
              ),
              left: BorderSide(
                color: black,
                style: BorderStyle.solid,
                width: 2,
              ),
              right: BorderSide(
                color: black,
                style: BorderStyle.solid,
                width: 2,
              ),
              bottom: BorderSide.none,
            ),
            borderRadius: BorderRadius.only(
              // Added border radius
              topLeft: Radius.circular(19), // Top left radius
              topRight: Radius.circular(19), // Top right radius
              bottomLeft: Radius.circular(0), // Bottom left radius
              bottomRight: Radius.circular(0), // Bottom right radius
            ),
          ),
        ),
      ),
      MenuAnchor(
        controller: _menuController,
        // alignmentOffset: const Offset(0, -45),
        // style: MenuStyle(
        //   minimumSize: WidgetStateProperty.all(
        //     Size(0, 45 * widget.options.length + 45),
        //   ),
        // ),
        menuChildren: widget.options.map((value) {
          return SizedBox(
            width: MediaQuery.of(context).size.width - 45,
            child: MenuItemButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
                    color: controller.isOpen ? Colors.deepPurple : black,
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
