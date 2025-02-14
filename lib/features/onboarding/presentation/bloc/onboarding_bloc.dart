import 'package:appetec/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<UpdateOnboardingEvent>((event, emit) {
      final previousOnboardingData = state.onboardingData;
      emit(OnboadingDataUpdate(
        onboardingData: OnboardingData(
          age: event.age ?? previousOnboardingData.age,
          gender: event.gender ?? previousOnboardingData.gender,
          height: event.height ?? previousOnboardingData.height,
          weight: event.weight ?? previousOnboardingData.weight,
          dietPreference:
              event.dietPreference ?? previousOnboardingData.dietPreference,
          mindGoal: event.mindGoal ?? previousOnboardingData.mindGoal,
          activityGoal:
              event.activityGoal ?? previousOnboardingData.activityGoal,
          physicalGoal:
              event.physicalGoal ?? previousOnboardingData.physicalGoal,
          sleepGoal: event.sleepGoal ?? previousOnboardingData.sleepGoal,
          deviceData: event.deviceData ?? previousOnboardingData.deviceData,
          deviceUsageLimit:
              event.deviceUsageLimit ?? previousOnboardingData.deviceUsageLimit,
          appPermissions:
              event.appPermissions ?? previousOnboardingData.appPermissions,
        ),
      ));
    });
  }
  @override
  void onChange(Change<OnboardingState> change) {
    debugPrint('OnboardingBloc state changed: $change');
    super.onChange(change);
  }
}
