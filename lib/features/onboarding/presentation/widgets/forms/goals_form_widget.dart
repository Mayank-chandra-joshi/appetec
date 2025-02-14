import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/core/common/input_fields/dropdown_widget3.dart';
import 'package:appetec/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:appetec/router/path_constants.dart';
import 'package:flutter/material.dart';
import 'package:appetec/core/common/bottons/simple_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GoalsSetupForm extends StatefulWidget {
  const GoalsSetupForm({super.key});

  @override
  GoalsSetupFormState createState() {
    return GoalsSetupFormState();
  }
}

class GoalsSetupFormState extends State<GoalsSetupForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> goalsOptions = [
    "To loose 5kgs and less",
    "To loose 10kgs",
    "To loose 20kgs",
    "To loose more than 20kgs",
    "Other"
  ];

  final List<String> activityOptions = [
    "Burn 100 kcal",
    "Burn 500 kcal",
    "Burn more than 500 kcal",
  ];

  final List<String> mindfulnessOptions = [
    "Avoiding Distractions",
    "Practice Mindful eating",
    "Balancing the Food and Activity"
  ];

  final List<String> sleepOptions = ["6 hours", "7hours", "8hours"];

  String selectedGoal = "";
  String selectedActivity = "";
  String selectedMindfulness = "";
  String selectedSleep = "";

  void onGoalChange(String? newValue) {
    if (newValue == null) return;
    setState(() {
      selectedGoal = newValue;
    });
  }

  void onActivityChange(String? newValue) {
    if (newValue == null) return;
    setState(() {
      selectedActivity = newValue;
    });
  }

  void onMindfulnessChange(String? newValue) {
    if (newValue == null) return;
    setState(() {
      selectedMindfulness = newValue;
    });
  }

  void onSleepChange(String? newValue) {
    if (newValue == null) return;
    setState(() {
      selectedSleep = newValue;
    });
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<OnboardingBloc>().add(
            UpdateOnboardingEvent(),
          );

      context.pushNamed(AppRouteConstants.SELECT_DEVICE);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Portal(
    // child:
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          Column(
            spacing: 16,
            children: [
              DropdownWidget3(
                placeholder: "Physical",
                options: goalsOptions,
                selectedOption: selectedGoal,
                onChanged: onGoalChange,
              ),
              DropdownWidget3(
                placeholder: "Movement/Activity",
                options: activityOptions,
                selectedOption: selectedActivity,
                onChanged: onActivityChange,
              ),
              DropdownWidget3(
                placeholder: "Mindfulness",
                options: mindfulnessOptions,
                selectedOption: selectedMindfulness,
                onChanged: onMindfulnessChange,
              ),
              DropdownWidget3(
                placeholder: "Sleep",
                options: sleepOptions,
                selectedOption: selectedSleep,
                onChanged: onSleepChange,
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
