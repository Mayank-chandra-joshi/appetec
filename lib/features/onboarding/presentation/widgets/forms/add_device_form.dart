import 'package:appetec/core/theme/colors.dart';
import 'package:appetec/core/common/bottons/simple_button.dart';
import 'package:appetec/core/common/input_fields/number_input_widget.dart';
import 'package:appetec/core/common/input_fields/textarea_widget.dart';
import 'package:appetec/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:appetec/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:appetec/router/path_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDeviceForm extends StatefulWidget {
  const AddDeviceForm({super.key});

  @override
  State<AddDeviceForm> createState() => _AddDeviceFormState();
}

class _AddDeviceFormState extends State<AddDeviceForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _idNumberController = TextEditingController();

  String? validateIdNumber(String? value) {
    if (value == null || value.isEmpty) return "Enter valid device id";
    return null;
  }

  void _submitForm(String? serialId) {
    if (_formKey.currentState!.validate()) {
      if (serialId == null || serialId.isEmpty) return;
      context.read<OnboardingBloc>().add(
            UpdateOnboardingPairDeviceEvent(
              deviceData: DeviceData(
                deviceId: _idNumberController.text.trim(),
                serialId: serialId,
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingPairDeviceUpdate) {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
          context.pushNamed(AppRouteConstants.GET_APP_PERMISSIONS);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: primaryPurple,
                  ),
                ),
                child: Text(
                  "Device Image",
                  style: GoogleFonts.exo(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              NumberInputWidget(
                placeholder: "ID Number",
                controller: _idNumberController,
                validator: validateIdNumber,
              ),
              SizedBox(
                height: 32,
              ),
              Row(
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
                    text: "Add",
                    onPressed: () {
                      _submitForm(
                          state.onboardingData.deviceMetaData?.serialId);
                    },
                    width: 120,
                    color: white,
                    bgcolor: primaryPurple,
                    frcolor: lightPurple,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                heightFactor: .8,
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 36,
                  width: 120,
                  child: TextButton(
                    onPressed: () {
                      context.read<OnboardingBloc>().add(
                            UpdateOnboardingPairDeviceEvent(
                              deviceData: null,
                            ),
                          );
                    },
                    child: Text(
                      "Skip >",
                      style: GoogleFonts.exo(
                        fontSize: 15,
                        color: Colors.deepPurple,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: .6,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
