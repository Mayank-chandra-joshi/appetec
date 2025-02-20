import 'package:appetec/core/common/snackbar/custom_snackbar.dart';
import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:appetec/router/path_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logoutUser(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    context.read<AuthBloc>().add(AuthLogout());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.of(context, rootNavigator: true).pop();
          customSnackbar(
            context,
            "Logged out successfully",
            ThemeColors.darkGreen,
            ThemeColors.white,
          );
          context.goNamed(AppRouteConstants.HOME);
        }

        if (state is AuthFailure) {
          customSnackbar(
              context, state.message, ThemeColors.redColor, ThemeColors.white);
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          color: ThemeColors.white,
        ),
        child: Text(
          'Home Page',
          style: GoogleFonts.exo(
            color: ThemeColors.black,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
