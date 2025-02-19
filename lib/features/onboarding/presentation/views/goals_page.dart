import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/core/utils/degreeToRadians.dart';
import 'package:appetec/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:appetec/features/onboarding/presentation/widgets/forms/goals_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return Container(
          color: darkGreen,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                color: darkGreen,
                child: Stack(
                  children: [
                    Positioned(
                      top: -50,
                      left: -50,
                      child: Image.asset(
                        "assets/images/Group 75@2x.png",
                        height: 150,
                      ),
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome ${state.userDetails!.name}!",
                              style: GoogleFonts.exo(
                                fontSize: 32,
                                color: white,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * .68,
                              ),
                              child: Text(
                                "Please provide some information to get started.",
                                style: GoogleFonts.exo(
                                  fontSize: 17,
                                  color: white,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      right: -110,
                      child: Transform.rotate(
                        angle: degreeToRadians(90),
                        child: Image.asset(
                          "assets/images/Group 432.png",
                          height: 160,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -60,
                      left: MediaQuery.of(context).size.width * .15,
                      child: Image.asset(
                        "assets/images/Illustrator 7.png",
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(24, 48, 24, 0),
                      child: Column(
                        spacing: 28,
                        children: [
                          Text(
                            "Goals",
                            style: GoogleFonts.exo(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: black,
                            ),
                          ),
                          Expanded(
                            child: GoalsSetupForm(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
