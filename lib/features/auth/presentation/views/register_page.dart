import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/features/auth/presentation/widgets/register_user_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: darkGreen,
        padding: const EdgeInsets.symmetric(
          vertical: 36.0,
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.center, // Make sure this is defined
          children: [
            Align(
              alignment: Alignment.center,
              child: Text("Register",
                  style: GoogleFonts.exo(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: white,
                  )),
            ),
            const SizedBox(height: 40), // Provide spacing
            UserRegisterForm(),
          ],
        ),
      ),
    );
  }
}
