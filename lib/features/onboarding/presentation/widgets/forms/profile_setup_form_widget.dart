import 'package:appetec/core/common/input_fields/dropdown/dropdown_list.dart';
import 'package:appetec/core/common/input_fields/dropdown/dropdown_trigger.dart';
import 'package:appetec/core/theme/colors.dart';
// import 'package:appetec/widgets/input_fields/dropdown_widget.dart';
// import 'package:appetec/widgets/input_fields/dropdown_widget2.dart';
import 'package:appetec/core/common/input_fields/dropdown_widget3.dart';
import 'package:appetec/core/common/input_fields/number_input_widget.dart';
import 'package:appetec/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:appetec/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:appetec/router/path_constants.dart';
// import 'package:appetec/widgets/input_fields/save_dropdown_widget2.dart';
import 'package:flutter/material.dart';
import 'package:appetec/core/common/bottons/simple_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_portal/flutter_portal.dart';

class ProfileSetupForm extends StatefulWidget {
  const ProfileSetupForm({super.key});

  @override
  ProfileSetupFormState createState() {
    return ProfileSetupFormState();
  }
}

class ProfileSetupFormState extends State<ProfileSetupForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final List<String> genderOptions = ["Male", "Female", "Others"];
  final List<String> dieteryPrefrencesOptions = [
    "Vegan",
    "Vegetarian",
    "Non Vegetarian",
    "Others"
  ];

  String selectedGender = "";
  String selectedDieteryPrefrences = "";
  bool isFromValidationFailed = false;
  bool isGenderDropdownOpen = false;
  bool isDieteryPrefrenceDropdownOpen = false;

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please input a valid age.';
    }

    final age = num.tryParse(value);

    if (age == null || age <= 18) {
      return "Only 18+ allowed";
    }
    return null;
  }

  String? validateHeight(String? value) {
    if (value == null || value == "") {
      return 'Please input a valid height.';
    }
    return null;
  }

  String? validateWeight(String? value) {
    if (value == null || value == "") {
      return 'Please input a valid weight.';
    }
    return null;
  }

  void onGenderChange(String? newValue) {
    if (newValue == null) return;
    setState(() {
      selectedGender = newValue;
    });
  }

  void onDieteryPreferenceChange(String? newValue) {
    if (newValue == null) return;
    setState(() {
      selectedDieteryPrefrences = newValue;
    });
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (selectedGender.isEmpty || selectedDieteryPrefrences.isEmpty) {
        setState(() {
          isFromValidationFailed = true;
        });
        return;
      }

      setState(() {
        isFromValidationFailed = false;
      });
      context.read<OnboardingBloc>().add(
            UpdateOnboardingProfileDetailsEvent(
                age: int.tryParse(_ageController.text.trim()),
                height: double.tryParse(_heightController.text.trim()),
                weight: double.tryParse(_weightController.text.trim()),
                gender: selectedGender,
                dietPreference: selectedDieteryPrefrences),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Portal(
    // child:
    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingDataProfileDetailsUpdate) {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
          context.pushNamed(AppRouteConstants.SET_GOALS);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Column(
              spacing: 16,
              children: [
                NumberInputWidget(
                  controller: _ageController,
                  placeholder: "Age",
                  validator: validateAge,
                ),
                NumberInputWidget(
                  controller: _heightController,
                  placeholder: "Height",
                  validator: validateHeight,
                  isFloatingPoint: true,
                ),
                NumberInputWidget(
                  controller: _weightController,
                  placeholder: "Weight",
                  validator: validateWeight,
                  isFloatingPoint: true,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 120,
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
                          onPressed: () => _submitForm(context),
                          width: 120,
                          color: white,
                          bgcolor: primaryPurple,
                          frcolor: lightPurple,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 100,
                    child: isFromValidationFailed &&
                            selectedDieteryPrefrences.isEmpty
                        ? Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Please select your dietery preference.",
                              style: GoogleFonts.exo(
                                fontSize: 12,
                                color: Colors.red,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                  Positioned(
                    top: 60,
                    left: 0,
                    right: 0,
                    child: DropdownList(
                      isOpen: isDieteryPrefrenceDropdownOpen,
                      options: dieteryPrefrencesOptions,
                      selectedOption: selectedDieteryPrefrences,
                      onChange: onDieteryPreferenceChange,
                      onToggle: () {
                        setState(() {
                          isDieteryPrefrenceDropdownOpen = false;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 60, // Move it down
                    left: 0,
                    right: 0,
                    child: DropdownTrigger(
                      placeholder: "Dietery preference",
                      selectedOption: selectedDieteryPrefrences,
                      isOpen: isDieteryPrefrenceDropdownOpen,
                      onToggle: () {
                        setState(() {
                          isDieteryPrefrenceDropdownOpen =
                              !isDieteryPrefrenceDropdownOpen;
                        });
                      },
                      formValidationFailed: isFromValidationFailed,
                      validationFailMessage: "Please select age",
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: isFromValidationFailed && selectedGender.isEmpty
                        ? Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Please select your gender.",
                              style: GoogleFonts.exo(
                                fontSize: 12,
                                color: Colors.red,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: DropdownList(
                      isOpen: isGenderDropdownOpen,
                      options: genderOptions,
                      selectedOption: selectedGender,
                      onChange: onGenderChange,
                      onToggle: () {
                        setState(() {
                          isGenderDropdownOpen = false;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 0, // Move it down
                    left: 0,
                    right: 0,
                    child: DropdownTrigger(
                      placeholder: "Sex",
                      selectedOption: selectedGender,
                      isOpen: isGenderDropdownOpen,
                      onToggle: () {
                        setState(() {
                          isGenderDropdownOpen = !isGenderDropdownOpen;
                        });
                      },
                      formValidationFailed: isFromValidationFailed,
                      validationFailMessage: "Please select gender.",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
