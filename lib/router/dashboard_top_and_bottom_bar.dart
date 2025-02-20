import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/router/path_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardTopAndBottombar extends StatelessWidget {
  final Widget child;
  const DashboardTopAndBottombar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // extendBodyBehindAppBar: true,
      backgroundColor: ThemeColors.darkGreen,
      appBar: AppBar(
        backgroundColor: ThemeColors.darkGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              // bottom: Radius.circular(30),
              ),
        ),
        toolbarHeight: 80,
        title: Text(
          'appetec',
          style: GoogleFonts.exo(
            color: ThemeColors.white,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: ThemeColors.white,
            ),
            tooltip: 'Settings',
            onPressed: () {
              final String currentUrl =
                  GoRouterState.of(context).uri.toString();

              if (currentUrl == '/settings') {
                context.pop();
              } else {
                context.pushNamed(AppRouteConstants.SETTINGS);
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        clipBehavior: Clip.hardEdge,
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          backgroundColor: ThemeColors.darkGreen,
          indicatorColor: Colors.transparent,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          elevation: 16,
          onDestinationSelected: (index) {
            // Handle navigation
            switch (index) {
              case 0:
                if (context.canPop()) context.pop();
                break;
              case 1:
                context.goNamed(AppRouteConstants.HOME);
                break;
              case 2:
                context.goNamed(AppRouteConstants.SETTINGS);
                break;
            }
          },
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(
                Icons.keyboard_return,
                size: 40,
                color: ThemeColors.white,
              ),
              label: 'Back',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.home,
                size: 40,
                color: ThemeColors.white,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.dashboard,
                size: 40,
                color: ThemeColors.white,
              ),
              label: 'Menu',
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}
