import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:appetec/router/path_constants.dart';
import 'package:appetec/core/common/bottons/logo_button.dart';
import 'package:appetec/core/common/input_fields/email_input_widget.dart';
import 'package:appetec/core/common/input_fields/password_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appetec/core/common/bottons/simple_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent dismissing
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      context.read<AuthBloc>().add(
            AuthLogin(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            ),
          );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
          const SizedBox(
            height: 16,
          ),
          PasswordInputWidget(
            controller: _passwordController,
            placeholder: "Password",
            validator: validatePassword,
          ),
          Align(
            heightFactor: .8,
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                style: GoogleFonts.exo(
                  fontSize: 15,
                  color: Colors.deepPurple,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5,
                  fontWeight: FontWeight.w500,
                  letterSpacing: .6,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleBtn(
                  text: "Log In",
                  onPressed: () => _submitForm(context),
                  width: 120,
                  color: white,
                  bgcolor: primaryPurple,
                  frcolor: lightPurple,
                ),
                SimpleBtn(
                  text: "Register",
                  onPressed: () {
                    GoRouter.of(context).pushNamed(
                      AppRouteConstants.REGISTER_USER,
                    );
                  },
                  width: 120,
                  color: white,
                  bgcolor: primaryPurple,
                  frcolor: lightPurple,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 56,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .75,
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoBtn(
                  text: 'Continue with Apple',
                  logo: Icons.apple,
                  onPressed: () {},
                  color: white,
                  bgcolor: primaryPurple,
                  frcolor: lightPurple,
                ),
                LogoBtn(
                  text: 'Continue with Google',
                  logo: Icons.apple,
                  onPressed: () {},
                  color: white,
                  bgcolor: primaryPurple,
                  frcolor: lightPurple,
                ),
                LogoBtn(
                  text: 'Continue with Facebook',
                  logo: Icons.apple,
                  onPressed: () {},
                  color: white,
                  bgcolor: primaryPurple,
                  frcolor: lightPurple,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
