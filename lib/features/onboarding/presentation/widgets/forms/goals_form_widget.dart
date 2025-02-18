import 'package:appetec/core/common/input_fields/dropdown/dropdown.dart';
import 'package:appetec/core/common/input_fields/dropdown/dropdown_list.dart';
import 'package:appetec/core/common/input_fields/dropdown/dropdown_trigger.dart';
import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:appetec/router/path_constants.dart';
import 'package:flutter/material.dart';
import 'package:appetec/core/common/bottons/simple_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalsSetupForm extends StatefulWidget {
  const GoalsSetupForm({super.key});

  @override
  GoalsSetupFormState createState() {
    return GoalsSetupFormState();
  }
}

class GoalsSetupFormState extends State<GoalsSetupForm> {
  final _formKey = GlobalKey<FormState>();

  bool isGoalsDropdownOpen = false;
  bool isActivityDropdownOpen = false;
  bool isMindfulnessDropdownOpen = false;
  bool isSleepOptionsOpen = false;
  bool isFromValidationFailed = false;

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

  String selectedPhysicalGoal = "";
  String selectedActivityGoal = "";
  String selectedMindfulnessGoal = "";
  String selectedSleepGoal = "";

  void onGoalChange(String? newValue) {
    if (newValue == null) return;
    setState(() {
      selectedPhysicalGoal = newValue;
    });
  }

  void onActivityChange(String? newValue) {
    if (newValue == null) return;
    setState(() {
      selectedActivityGoal = newValue;
    });
  }

  void onMindfulnessChange(String? newValue) {
    if (newValue == null) return;
    setState(() {
      selectedMindfulnessGoal = newValue;
    });
  }

  void onSleepChange(String? newValue) {
    if (newValue == null) return;
    setState(() {
      selectedSleepGoal = newValue;
    });
  }

  void _submitForm(BuildContext context) {
    if (selectedPhysicalGoal.isEmpty ||
        selectedActivityGoal.isEmpty ||
        selectedMindfulnessGoal.isEmpty ||
        selectedSleepGoal.isEmpty) {
      setState(() {
        isFromValidationFailed = true;
      });
      return;
    }

    setState(() {
      isFromValidationFailed = false;
    });

    context.read<OnboardingBloc>().add(
          UpdateOnboardingGoalsEvent(
            physicalGoal: selectedPhysicalGoal,
            activityGoal: selectedActivityGoal,
            mindGoal: selectedMindfulnessGoal,
            sleepGoal: selectedSleepGoal,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    // Portal(
    // child:
    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingDataGoalsUpdate) {
          context.pushNamed(AppRouteConstants.SELECT_DEVICE);
        }
      },
      child: Form(
        key: _formKey,
        child: Stack(
          children: [
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
            Positioned(
              top: 220,
              child: isFromValidationFailed && selectedSleepGoal.isEmpty
                  ? Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Please select sleep goal",
                        style: GoogleFonts.exo(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            Positioned(
              top: 180,
              left: 0,
              right: 0,
              child: DropdownList(
                isOpen: isSleepOptionsOpen,
                options: sleepOptions,
                selectedOption: selectedSleepGoal,
                onChange: onSleepChange,
              ),
            ),
            Positioned(
              top: 180, // Move it down
              left: 0,
              right: 0,
              child: DropdownTrigger(
                placeholder: "Sleep",
                selectedOption: selectedSleepGoal,
                isOpen: isSleepOptionsOpen,
                onToggle: () {
                  setState(() {
                    isSleepOptionsOpen = !isSleepOptionsOpen;
                  });
                },
                formValidationFailed: isFromValidationFailed,
                validationFailMessage: "Please select Mind goal",
              ),
            ),
            Positioned(
              top: 160,
              child: isFromValidationFailed && selectedMindfulnessGoal.isEmpty
                  ? Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Please select mindfulness goal",
                        style: GoogleFonts.exo(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: DropdownList(
                isOpen: isMindfulnessDropdownOpen,
                options: mindfulnessOptions,
                selectedOption: selectedMindfulnessGoal,
                onChange: onMindfulnessChange,
              ),
            ),
            Positioned(
              top: 120, // Move it down
              left: 0,
              right: 0,
              child: DropdownTrigger(
                placeholder: "Mindfulness",
                selectedOption: selectedMindfulnessGoal,
                isOpen: isMindfulnessDropdownOpen,
                onToggle: () {
                  setState(() {
                    isMindfulnessDropdownOpen = !isMindfulnessDropdownOpen;
                  });
                },
                formValidationFailed: isFromValidationFailed,
                validationFailMessage: "Please select mindfullness goal",
              ),
            ),
            Positioned(
              top: 100,
              child: isFromValidationFailed && selectedActivityGoal.isEmpty
                  ? Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Please select activity goal",
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
                isOpen: isActivityDropdownOpen,
                options: activityOptions,
                selectedOption: selectedActivityGoal,
                onChange: onActivityChange,
              ),
            ),
            Positioned(
              top: 60, // Move it down
              left: 0,
              right: 0,
              child: DropdownTrigger(
                placeholder: "Movement/Activity",
                selectedOption: selectedActivityGoal,
                isOpen: isActivityDropdownOpen,
                onToggle: () {
                  setState(() {
                    isActivityDropdownOpen = !isActivityDropdownOpen;
                  });
                },
                formValidationFailed: isFromValidationFailed,
                validationFailMessage: "Please select activity goal",
              ),
            ),
            Positioned(
              top: 40,
              child: isFromValidationFailed && selectedPhysicalGoal.isEmpty
                  ? Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Please select physical goal",
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
                isOpen: isGoalsDropdownOpen,
                options: goalsOptions,
                selectedOption: selectedPhysicalGoal,
                onChange: onGoalChange,
              ),
            ),
            Positioned(
              top: 0, // Move it down
              left: 0,
              right: 0,
              child: DropdownTrigger(
                  placeholder: "Physical",
                  selectedOption: selectedPhysicalGoal,
                  isOpen: isGoalsDropdownOpen,
                  onToggle: () {
                    setState(() {
                      isGoalsDropdownOpen = !isGoalsDropdownOpen;
                    });
                  },
                  formValidationFailed: isFromValidationFailed,
                  validationFailMessage: "Please select physical goal"),
            ),
            // Positioned(
            //   top: 180,
            //   left: 0,
            //   right: 0,
            //   child: Dropdown(
            //     isOpen: isSleepOptionsOpen,
            //     options: sleepOptions,
            //     selectedOption: selectedSleepGoal,
            //     onChange: (newOption) {
            //       setState(() {
            //         selectedSleepGoal = newOption;
            //       });
            //     },
            //     placeholder: "Sleep",
            //     onToggle: () {
            //       setState(() {
            //         isSleepOptionsOpen = !isSleepOptionsOpen;
            //       });
            //     },
            //     formValidationFailed: isFromValidationFailed,
            //     validationFailMessage: "Please select sleep goal",
            //   ),
            // ),
            // Positioned(
            //   top: 120,
            //   left: 0,
            //   right: 0,
            //   child: Dropdown(
            //     isOpen: isMindfulnessDropdownOpen,
            //     options: mindfulnessOptions,
            //     selectedOption: selectedMindfulnessGoal,
            //     onChange: (newOption) {
            //       setState(() {
            //         selectedMindfulnessGoal = newOption;
            //       });
            //     },
            //     placeholder: "Mindfulness",
            //     onToggle: () {
            //       setState(() {
            //         isMindfulnessDropdownOpen = !isMindfulnessDropdownOpen;
            //       });
            //     },
            //     formValidationFailed: isFromValidationFailed,
            //     validationFailMessage: "Please select mindfulness goal",
            //   ),
            // ),
            // Positioned(
            //     top: 60,
            //     left: 0,
            //     right: 0,
            //     child: Dropdown(
            //       isOpen: isActivityDropdownOpen,
            //       options: activityOptions,
            //       selectedOption: selectedActivityGoal,
            //       onChange: (newOption) {
            //         setState(() {
            //           selectedActivityGoal = newOption;
            //         });
            //       },
            //       placeholder: "Movement/Activity",
            //       onToggle: () {
            //         setState(() {
            //           isActivityDropdownOpen = !isActivityDropdownOpen;
            //         });
            //       },
            //       formValidationFailed: isFromValidationFailed,
            //       validationFailMessage: "Please select activity goal",
            //     )),
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   right: 0,
            //   child: Dropdown(
            //     isOpen: isGoalsDropdownOpen,
            //     options: goalsOptions,
            //     selectedOption: selectedPhysicalGoal,
            //     onChange: (newOption) {
            //       setState(() {
            //         selectedPhysicalGoal = newOption;
            //       });
            //     },
            //     placeholder: "Physical",
            //     onToggle: () {
            //       setState(() {
            //         isGoalsDropdownOpen = !isGoalsDropdownOpen;
            //       });
            //     },
            //     formValidationFailed: isFromValidationFailed,
            //     validationFailMessage: "Please select physical goal",
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
