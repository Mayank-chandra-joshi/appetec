import 'package:appetec/constants/colors.dart';
import 'package:flutter/material.dart';

class EmailInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  final String? Function(String?)? validator;

  const EmailInputWidget({
    super.key,
    required this.controller,
    this.placeholder,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: placeholder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(width: 2.0, color: Colors.deepPurple),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(width: 2.0, color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(width: 2.0, color: Colors.red),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          filled: true,
          fillColor: white,
        ),
      ),
    );
  }
}
