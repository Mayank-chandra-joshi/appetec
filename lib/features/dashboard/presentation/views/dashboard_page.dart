import 'package:appetec/core/theme/colors.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.lightPurple,
      child: Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
