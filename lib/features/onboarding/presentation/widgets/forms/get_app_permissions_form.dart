import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/core/common/bottons/simple_button.dart';
import 'package:appetec/core/common/cards/app_permission_card.dart';
import 'package:flutter/material.dart';

class GetAppPermissionFrom extends StatefulWidget {
  const GetAppPermissionFrom({super.key});

  @override
  State<GetAppPermissionFrom> createState() => _GetAppPermissionFromState();
}

class _GetAppPermissionFromState extends State<GetAppPermissionFrom> {
  final _formKey = GlobalKey<FormState>();

  bool appleHealthPermission = false;
  bool googleHealthPermission = false;

  void Function(bool)? getAppleHealthPermission(value) {
    setState(() {
      appleHealthPermission = value;
    });
  }

  void Function(bool)? getGoogleHealthPermission(value) {
    setState(() {
      googleHealthPermission = value;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          Column(
            spacing: 16,
            children: [
              AppPermissionCard(
                image: "assets/images/apple_health.png",
                title: "Workout & Health data",
                desc:
                    "'Appetec' would like to access and update your health data",
                value: appleHealthPermission,
                setValue: getAppleHealthPermission,
              ),
              AppPermissionCard(
                image: "assets/images/google_health.png",
                title: "Workout & Health data",
                desc:
                    "'Appetec' would like to access and update your health data",
                value: googleHealthPermission,
                setValue: getGoogleHealthPermission,
              ),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * .15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleBtn(
                  text: "Back",
                  onPressed: () {},
                  width: 120,
                  color: white,
                  bgcolor: primaryPurple,
                  frcolor: lightPurple,
                ),
                SimpleBtn(
                  text: "Next",
                  onPressed: _submitForm,
                  width: 120,
                  color: white,
                  bgcolor: primaryPurple,
                  frcolor: lightPurple,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
