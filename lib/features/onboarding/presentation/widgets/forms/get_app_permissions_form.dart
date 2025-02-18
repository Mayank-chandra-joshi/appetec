import 'dart:math';

import 'package:appetec/core/common/snackbar/custom_snackbar.dart';
import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/core/common/bottons/simple_button.dart';
import 'package:appetec/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:appetec/features/onboarding/presentation/widgets/cards/app_permission_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:platform/platform.dart';

class GetAppPermissionFrom extends StatefulWidget {
  const GetAppPermissionFrom({super.key});

  @override
  State<GetAppPermissionFrom> createState() => _GetAppPermissionFromState();
}

class _GetAppPermissionFromState extends State<GetAppPermissionFrom> {
  final _formKey = GlobalKey<FormState>();

  bool appleHealthPermission = false;
  bool googleHealthPermission = false;

  @override
  void initState() {
    super.initState();
    var platform = LocalPlatform();
    if (platform.isIOS) {
      getAppleHealthPermission();
    } else if (platform.isAndroid) {
      getGoogleHealthPermission();
    }
  }

  Future getAppleHealthPermission() async {
    HapticFeedback.mediumImpact();

    var platform = LocalPlatform();

    if (!platform.isIOS) {
      customSnackbar(
          context, "Apple health can only be used in IOS.", redColor, white);
      return;
    }

    setState(() {
      appleHealthPermission = true;
    });
  }

  void getGoogleHealthPermission() async {
    HapticFeedback.mediumImpact();

    // debugPrint("called");

    var platform = LocalPlatform();

    if (!platform.isAndroid) {
      customSnackbar(context, "Google health can only be used in Android.",
          redColor, white);
      return;
    }

    bool healthPermissionGranted = false;
    bool locationPermissionGranted = false;

    await Permission.activityRecognition.onDeniedCallback(() {
      customSnackbar(
          context,
          "Health data is required to use this app.Give permissions from settings",
          redColor,
          white);
      return;
    }).onGrantedCallback(() {
      healthPermissionGranted = true;
    }).onPermanentlyDeniedCallback(() {
      customSnackbar(
        context,
        "Health data is required to use this app.Give permissions from settings",
        redColor,
        white,
      );
      return;
    }).onRestrictedCallback(() {
      customSnackbar(
        context,
        "Health data is required to use this app.Give permissions from settings",
        redColor,
        white,
      );
      return;
    }).onLimitedCallback(() {
      customSnackbar(
        context,
        "Limited access to health data. Please enable full access in settings.",
        redColor,
        white,
      );
      return;
    }).onProvisionalCallback(() {
      customSnackbar(
        context,
        "Health data is required to use this app.Give permissions from settings",
        redColor,
        white,
      );
      return;
    }).request();

    // debugPrint("calleddddd");

    await Permission.location.onDeniedCallback(() {
      customSnackbar(
          context,
          "Location is required to use this app.Give permissions from settings",
          redColor,
          white);
      return;
    }).onGrantedCallback(() {
      locationPermissionGranted = true;
    }).onPermanentlyDeniedCallback(() {
      customSnackbar(
        context,
        "Location is required to use this app.Give permissions from settings",
        redColor,
        white,
      );
      return;
    }).onRestrictedCallback(() {
      customSnackbar(
        context,
        "Location is required to use this app properly.",
        ThemeColors.lightOrange,
        white,
      );
      locationPermissionGranted = true;
    }).onLimitedCallback(() {
      customSnackbar(
        context,
        "Limited access to Location. Please enable full access in settings.",
        ThemeColors.lightOrange,
        white,
      );
      locationPermissionGranted = true;
    }).onProvisionalCallback(() {
      customSnackbar(
        context,
        "Location is required to use this app.Give permissions from settings",
        ThemeColors.lightOrange,
        white,
      );
      locationPermissionGranted = true;
    }).request();

    bool hasGrantedAllHealthDataPermission = false;

    if (healthPermissionGranted) {
      final health = Health();
      await health.configure();

      var types = [
        HealthDataType.STEPS,
        HealthDataType.BLOOD_GLUCOSE,
        HealthDataType.ACTIVE_ENERGY_BURNED
      ];

      List<HealthDataType> permissionsLeft = [];

      // Use Future.wait to process multiple async calls
      List<bool?> results = await Future.wait(types.map((type) async {
        return await health.hasPermissions([type]);
      }));

      // Collect permissions that are not granted
      for (int i = 0; i < types.length; i++) {
        if (!(results[i] ?? false)) {
          permissionsLeft.add(types[i]);
        }
      }
      // requesting access to the data types before reading them
      await health.requestAuthorization(types);

      hasGrantedAllHealthDataPermission = permissionsLeft.isEmpty;
    }

    if (!hasGrantedAllHealthDataPermission) {
      customSnackbar(
        context,
        "Please provide all the required health data permissions.",
        ThemeColors.redColor,
        white,
      );
      return;
    }

    setState(() {
      if (healthPermissionGranted &&
          locationPermissionGranted &&
          hasGrantedAllHealthDataPermission) {
        googleHealthPermission = true;
      }
    });
  }

  void _submitForm() {
    if (!googleHealthPermission && !appleHealthPermission) {
      customSnackbar(
        context,
        "Please allow location and health permissions.",
        ThemeColors.redColor,
        white,
      );
      return;
    }

    context
        .read<OnboardingBloc>()
        .add(UpdateOnboardingAppPermissionsEvent(appPermissions: [
          "google_fit",
        ]));
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
                  onPressed: () {
                    context.pop();
                  },
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
