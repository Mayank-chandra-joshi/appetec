import 'package:appetec/core/theme/colors.dart';
// import 'package:appetec/widgets/input_fields/dropdown_widget.dart';
// import 'package:appetec/widgets/input_fields/dropdown_widget2.dart';
import 'package:appetec/core/common/input_fields/dropdown_widget3.dart';
import 'package:appetec/core/common/input_fields/number_input_widget.dart';
import 'package:appetec/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:appetec/router/path_constants.dart';
// import 'package:appetec/widgets/input_fields/save_dropdown_widget2.dart';
import 'package:flutter/material.dart';
import 'package:appetec/core/common/bottons/simple_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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

  String? validateAge(String? value) {
    if (value == null) {
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
      context.read<OnboardingBloc>().add(
            UpdateOnboardingEvent(
                age: int.tryParse(_ageController.text.trim()),
                height: double.tryParse(_heightController.text.trim()),
                weight: double.tryParse(_weightController.text.trim()),
                gender: selectedGender,
                dietPreference: selectedDieteryPrefrences),
          );

      context.pushNamed(AppRouteConstants.SET_GOALS);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Portal(
    // child:
    return Form(
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
              ),
              NumberInputWidget(
                controller: _weightController,
                placeholder: "Weight",
                validator: validateWeight,
              ),
              DropdownWidget3(
                placeholder: "Sex",
                options: genderOptions,
                selectedOption: selectedGender,
                onChanged: onGenderChange,
              ),
              DropdownWidget3(
                placeholder: "Dietery Prefrences",
                options: dieteryPrefrencesOptions,
                selectedOption: selectedDieteryPrefrences,
                onChanged: onDieteryPreferenceChange,
              ),
            ],
          ),
          Expanded(
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
        ],
      ),
    );
  }
}
