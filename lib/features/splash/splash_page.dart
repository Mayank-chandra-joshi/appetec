import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/router/path_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // Waits for 3 seconds before navigating to the home screen
  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    // Using GoRouter to navigate to the home route
    if (mounted) {
      context.goNamed(AppRouteConstants.HOME);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: darkGreen,
        alignment: Alignment.center,
        child: Text(
          'Appetec',
          style: GoogleFonts.exo(
            color: white,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text(
          'Welcome Home!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
