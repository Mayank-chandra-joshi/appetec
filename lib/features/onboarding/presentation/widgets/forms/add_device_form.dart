import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/core/common/bottons/simple_button.dart';
import 'package:appetec/core/common/input_fields/number_input_widget.dart';
import 'package:appetec/core/common/input_fields/textarea_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDeviceForm extends StatefulWidget {
  const AddDeviceForm({super.key});

  @override
  State<AddDeviceForm> createState() => _AddDeviceFormState();
}

class _AddDeviceFormState extends State<AddDeviceForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _imageDataController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();

  String? validateImageData(String? value) {
    if (value == null || value.isEmpty) return "Enter valid device image data";
    return null;
  }

  String? validateIdNumber(String? value) {
    if (value == null || value.isEmpty) return "Enter valid device id";
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextAreaWidget(
            maxLines: 5,
            controller: _imageDataController,
            placeholder: "Reference Image",
            validator: validateImageData,
          ),
          SizedBox(
            height: 16,
          ),
          NumberInputWidget(
            placeholder: "ID Number",
            controller: _idNumberController,
            validator: validateIdNumber,
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SimpleBtn(
                text: "Back",
                onPressed: () {},
                width: 120,
                color: white,
                bgcolor: primaryPurple,
                frcolor: lightPurple,
              ),
              SimpleBtn(
                text: "Add",
                onPressed: _submitForm,
                width: 120,
                color: white,
                bgcolor: primaryPurple,
                frcolor: lightPurple,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Align(
            heightFactor: .8,
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 36,
              width: 120,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Skip >",
                  style: GoogleFonts.exo(
                    fontSize: 15,
                    color: Colors.deepPurple,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: .6,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
