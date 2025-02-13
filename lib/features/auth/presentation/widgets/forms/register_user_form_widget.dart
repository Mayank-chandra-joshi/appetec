import 'package:appetec/core/common/input_fields/text_input_widget.dart';
import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/core/common/input_fields/checkbox_with_text.dart';
import 'package:appetec/core/common/input_fields/email_input_widget.dart';
import 'package:appetec/core/common/input_fields/password_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:appetec/core/common/bottons/simple_button.dart';
import 'package:go_router/go_router.dart';

class UserRegisterForm extends StatefulWidget {
  const UserRegisterForm({super.key});

  @override
  UserRegisterFormState createState() {
    return UserRegisterFormState();
  }
}

class UserRegisterFormState extends State<UserRegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool hasAcceptedTandC = false;

  bool _isSubmittingForm = false;

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter name.';
    }

    return null;
  }

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
      return "Password and Confirm Password doesn't match";
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
    setState(() {
      _isSubmittingForm = true;
    });
    if (_formKey.currentState!.validate()) {}
    setState(() {
      _isSubmittingForm = false;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextInputWidget(
            controller: _nameController,
            placeholder: "Name",
            validator: validateName,
          ),
          const SizedBox(
            height: 16,
          ),
          EmailInputWidget(
            controller: _emailController,
            placeholder: "Email",
            validator: validateEmail,
          ),
          const SizedBox(
            height: 16,
          ),
          PasswordInputWidget(
            controller: _passwordController,
            placeholder: "Create Password",
            validator: validatePassword,
          ),
          const SizedBox(
            height: 16,
          ),
          PasswordInputWidget(
            controller: _confirmPasswordController,
            placeholder: "Confrim Password",
            validator: validateConfirmPassword,
          ),
          const SizedBox(
            height: 16,
          ),
          TextCheckBox(
            isChecked: hasAcceptedTandC,
            label: "I agree to Appetech's Terms & Conditions & Privacy Policy.",
            validator: validateAcceptedTandC,
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SimpleBtn(
                text: "Back",
                onPressed: _isSubmittingForm
                    ? () {}
                    : () {
                        GoRouter.of(context).pop();
                      },
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
