import 'package:appetec/constants/colors.dart';
// import 'package:appetec/widgets/input_fields/dropdown_widget.dart';
// import 'package:appetec/widgets/input_fields/dropdown_widget2.dart';
import 'package:appetec/widgets/input_fields/dropdown_widget3.dart';
import 'package:appetec/widgets/input_fields/number_input_widget.dart';
// import 'package:appetec/widgets/input_fields/save_dropdown_widget2.dart';
import 'package:flutter/material.dart';
import 'package:appetec/widgets/bottons/simple_button.dart';
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String age = _ageController.text.trim();
    } else {}
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
