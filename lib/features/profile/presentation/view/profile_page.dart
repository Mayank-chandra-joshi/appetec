import 'package:appetec/core/common/bottons/simple_button.dart';
import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/router/path_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: ThemeColors.white,
      ),
      child: Container(
        margin: EdgeInsets.only(top: 40),
        child: Center(
            child: Column(
          children: [
            SimpleBtn(
                onPressed: () {
                  context.pushNamed(AppRouteConstants.DASHBOARD);
                },
                text: "Select device page",
                color: ThemeColors.white,
                bgcolor: ThemeColors.lightGreen)
          ],
        )),
      ),
    );
  }
}
