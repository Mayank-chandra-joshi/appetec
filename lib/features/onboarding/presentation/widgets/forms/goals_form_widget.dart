import 'package:appetec/core/common/input_fields/dropdown/dropdown.dart';
import 'package:appetec/core/common/input_fields/dropdown/dropdown_list.dart';
import 'package:appetec/core/common/input_fields/dropdown/dropdown_options.dart';
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
  bool isDeviceUsageOptionsOpen = false;
  bool isFromValidationFailed = false;

  final List<DropdownOption<String>> goalsOptions = [
    DropdownOption(
        label: "To lose 5kgs and less", value: "To lose 5kgs and less"),
    DropdownOption(label: "To lose 10kgs", value: "To lose 10kgs"),
    DropdownOption(label: "To lose 20kgs", value: "To lose 20kgs"),
    DropdownOption(
        label: "To lose more than 20kgs", value: "To lose more than 20kgs"),
    DropdownOption(label: "Other", value: "Other"),
  ];

  final List<DropdownOption<String>> activityOptions = [
    DropdownOption(label: "Burn 100 kcal", value: "Burn 100 kcal"),
    DropdownOption(label: "Burn 500 kcal", value: "Burn 500 kcal"),
    DropdownOption(
        label: "Burn more than 500 kcal", value: "Burn more than 500 kcal"),
  ];

  final List<DropdownOption<String>> mindfulnessOptions = [
    DropdownOption(
        label: "Avoiding Distractions", value: "Avoiding Distractions"),
    DropdownOption(
        label: "Practice Mindful Eating", value: "Practice Mindful Eating"),
    DropdownOption(
        label: "Balancing the Food and Activity",
        value: "Balancing the Food and Activity"),
  ];

  final List<DropdownOption<String>> sleepOptions = [
    DropdownOption(label: "6 hours", value: "6 hours"),
    DropdownOption(label: "7 hours", value: "7 hours"),
    DropdownOption(label: "8 hours", value: "8 hours"),
  ];

  final List<DropdownOption<double>> deviceUsageLimitOptions = [
    DropdownOption(label: "2 hours", value: 2.0),
    DropdownOption(label: "2.5 hours", value: 2.5),
    DropdownOption(label: "3 hours", value: 3.0),
  ];

  String selectedPhysicalGoal = "";
  String selectedPhysicalGoalLabel = "";
  String selectedActivityGoal = "";
  String selectedActivityGoalLabel = "";
  String selectedMindfulnessGoal = "";
  String selectedMindfulnessGoalLabel = "";
  String selectedSleepGoal = "";
  String selectedSleepGoalLabel = "";
  double? selectedDeviceUsageLimit;
  String selectedDeviceUsageLimitLabel = "";

  void onGoalChange(String? newLabel, String? newValue) {
    if (newValue == null || newLabel == null) return;
    setState(() {
      selectedPhysicalGoal = newLabel;
      selectedPhysicalGoalLabel = newValue;
    });
  }

  void onActivityChange(String? newLabel, String? newValue) {
    if (newValue == null || newLabel == null) return;
    setState(() {
      selectedActivityGoal = newValue;
      selectedActivityGoalLabel = newLabel;
    });
  }

  void onMindfulnessChange(String? newLabel, String? newValue) {
    if (newValue == null || newLabel == null) return;
    setState(() {
      selectedMindfulnessGoal = newValue;
      selectedMindfulnessGoalLabel = newLabel;
    });
  }

  void onSleepChange(String? newLabel, String? newValue) {
    if (newValue == null || newLabel == null) return;
    setState(() {
      selectedSleepGoal = newValue;
      selectedSleepGoalLabel = newLabel;
    });
  }

  void onDeviceUsageLimitChange(String? newLabel, double? newValue) {
    if (newValue == null || newLabel == null) return;
    setState(() {
      selectedDeviceUsageLimit = newValue;
      selectedDeviceUsageLimitLabel = newLabel;
    });
  }

  void _submitForm(BuildContext context) {
    if (selectedPhysicalGoal.isEmpty ||
        selectedActivityGoal.isEmpty ||
        selectedMindfulnessGoal.isEmpty ||
        selectedSleepGoal.isEmpty ||
        selectedDeviceUsageLimit == null) {
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
            deviceUsageLimit: selectedDeviceUsageLimit,
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
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
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
              top: 280,
              child: isFromValidationFailed &&
                      selectedDeviceUsageLimitLabel.isEmpty
                  ? Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Please select device usage goal",
                        style: GoogleFonts.exo(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            Positioned(
              top: 240,
              left: 0,
              right: 0,
              child: DropdownList(
                isOpen: isDeviceUsageOptionsOpen,
                options: deviceUsageLimitOptions,
                selectedOption: selectedDeviceUsageLimit,
                onChange: onDeviceUsageLimitChange,
                onToggle: () {
                  setState(() {
                    isDeviceUsageOptionsOpen = false;
                  });
                },
              ),
            ),
            Positioned(
              top: 240, // Move it down
              left: 0,
              right: 0,
              child: DropdownTrigger(
                placeholder: "Device usage",
                selectedLabel: selectedDeviceUsageLimitLabel,
                selectedOption: selectedDeviceUsageLimit,
                isOpen: isDeviceUsageOptionsOpen,
                onToggle: () {
                  setState(() {
                    isDeviceUsageOptionsOpen = !isDeviceUsageOptionsOpen;
                  });
                },
                formValidationFailed: isFromValidationFailed,
                validationFailMessage: "Please select device usage goal",
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
                onToggle: () {
                  setState(() {
                    isSleepOptionsOpen = false;
                  });
                },
              ),
            ),
            Positioned(
              top: 180, // Move it down
              left: 0,
              right: 0,
              child: DropdownTrigger(
                placeholder: "Sleep",
                selectedLabel: selectedSleepGoalLabel,
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
                onToggle: () {
                  setState(() {
                    isMindfulnessDropdownOpen = false;
                  });
                },
              ),
            ),
            Positioned(
              top: 120, // Move it down
              left: 0,
              right: 0,
              child: DropdownTrigger(
                placeholder: "Mindfulness",
                selectedLabel: selectedMindfulnessGoalLabel,
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
                onToggle: () {
                  setState(() {
                    isActivityDropdownOpen = false;
                  });
                },
              ),
            ),
            Positioned(
              top: 60, // Move it down
              left: 0,
              right: 0,
              child: DropdownTrigger(
                placeholder: "Movement/Activity",
                selectedLabel: selectedActivityGoalLabel,
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
                onToggle: () {
                  setState(() {
                    isGoalsDropdownOpen = false;
                  });
                },
              ),
            ),
            Positioned(
              top: 0, // Move it down
              left: 0,
              right: 0,
              child: DropdownTrigger(
                  placeholder: "Physical",
                  selectedLabel: selectedPhysicalGoalLabel,
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
