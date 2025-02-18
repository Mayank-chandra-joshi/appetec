import 'package:appetec/core/common/snackbar/custom_snackbar.dart';
import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:appetec/features/auth/presentation/widgets/forms/login_form_widget.dart';
import 'package:appetec/router/path_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess || state is AuthFailure) {
              Navigator.of(context, rootNavigator: true).pop();
            }

            if (state is AuthSuccess) {
              customSnackbar(
                  context, "Logged in successfully", darkGreen, white);
              context.goNamed(AppRouteConstants.PROFILE_SETUP);
            }

            if (state is AuthFailure) {
              customSnackbar(context, state.message, redColor, white);
            }
          },
          child: Container(
            color: darkGreen,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  color: darkGreen,
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 120,
                      height: 90,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.72,
                  decoration: const BoxDecoration(
                    color: white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50)),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Image.asset(
                          "assets/images/Group 77.png",
                          // colorBlendMode: BlendMode.xor,
                        ),
                      ),
                      Positioned(
                        top: 50,
                        right: -30,
                        child: Image.asset(
                          "assets/images/Group 432.png",
                          height: 90,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: -30,
                        child: Image.asset(
                          "assets/images/Group 75@2x.png",
                          height: 140,
                        ),
                      ),
                      Positioned(
                        bottom: -60,
                        right: -70,
                        child: Transform.rotate(
                          angle: 1,
                          child: Image.asset(
                            "assets/images/Group 77.png",
                            height: 200,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 60.0,
                          horizontal: 20,
                        ),
                        child: Column(
                          spacing: 36,
                          children: [
                            Text(
                              "Log In",
                              style: GoogleFonts.exo(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                                color: black,
                              ),
                            ),
                            LoginForm(),
                          ],
                        ),
                      ),
                      // Positioned(
                      //   top: 0,
                      //   left: 0,
                      //   child: Image.asset(
                      //     "assets/images/Group 77.png",
                      //     // colorBlendMode: BlendMode.xor,
                      //   ),
                      // ),
                      // Positioned(
                      //   top: 50,
                      //   right: -30,
                      //   child: Image.asset("assets/images/Group 432.png"),
                      // ),
                      // Positioned(
                      //   bottom: 5,
                      //   left: -30,
                      //   child: Image.asset(
                      //     "assets/images/Group 75@2x.png",
                      //     height: 140,
                      //   ),
                      // ),
                      // Positioned(
                      //   bottom: -60,
                      //   right: -70,
                      //   child: Transform.rotate(
                      //     angle: 1,
                      //     child: Image.asset(
                      //       "assets/images/Group 77.png",
                      //       height: 200,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
