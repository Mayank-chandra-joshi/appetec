import 'package:appetec/constants/colors.dart';
import 'package:appetec/widgets/input_fields/checkbox_with_text.dart';
import 'package:appetec/widgets/input_fields/email_input_widget.dart';
import 'package:appetec/widgets/input_fields/password_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:appetec/widgets/bottons/simple_button.dart';

class UserRegisterForm extends StatefulWidget {
  const UserRegisterForm({super.key});

  @override
  UserRegisterFormState createState() {
    return UserRegisterFormState();
  }
}

class UserRegisterFormState extends State<UserRegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool hasAcceptedTandC = false;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email.';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email.';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != _passwordController.text.trim()) {
      return "Password and Confrim Password doesn't match";
    }
    return null;
  }

  String? validateAcceptedTandC(bool? value) {
    if (value == null || !value) {
      return "";
    }
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
          EmailInputWidget(
            controller: _emailController,
            placeholder: "Email",
            validator: validateEmail,
          ),
          SizedBox(
            height: 16,
          ),
          PasswordInputWidget(
            controller: _passwordController,
            placeholder: "Create Password",
            validator: validatePassword,
          ),
          SizedBox(
            height: 16,
          ),
          PasswordInputWidget(
            controller: _confirmPasswordController,
            placeholder: "Confrim Password",
            validator: validateConfirmPassword,
          ),
          SizedBox(
            height: 16,
          ),
          TextCheckBox(
            isChecked: hasAcceptedTandC,
            label: "I agree to Appetech's Terms & Conditions & Privacy Policy.",
            validator: validateAcceptedTandC,
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SimpleBtn(
                text: "Back",
                onPressed: () {},
                width: 120,
                color: primaryPurple,
                bgcolor: lightGreen,
              ),
              SimpleBtn(
                text: "Register",
                onPressed: _submitForm,
                width: 120,
                color: primaryPurple,
                bgcolor: lightGreen,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
