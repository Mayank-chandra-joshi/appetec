import 'package:appetec/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<UpdateOnboardingProfileDetailsEvent>(
      (event, emit) {
        emit(OnboardingDataProfileDetailsUpdate(
          onboardingData: OnboardingData(
            age: event.age,
            gender: event.gender,
            height: event.height,
            weight: event.weight,
            dietPreference: event.dietPreference,
          ),
        ));
      },
    );
    on<UpdateOnboardingGoalsEvent>(
      (event, emit) {
        final previousOnboardingData = state.onboardingData;
        emit(OnboardingDataGoalsUpdate(
          onboardingData: OnboardingData(
            age: event.age ?? previousOnboardingData.age,
            gender: event.gender ?? previousOnboardingData.gender,
            height: event.height ?? previousOnboardingData.height,
            weight: event.weight ?? previousOnboardingData.weight,
            dietPreference:
                event.dietPreference ?? previousOnboardingData.dietPreference,
            mindGoal: event.mindGoal,
            activityGoal: event.activityGoal,
            physicalGoal: event.physicalGoal,
            sleepGoal: event.sleepGoal,
            deviceUsageLimit: event.deviceUsageLimit,
          ),
        ));
      },
    );
    on<UpdateOnboardingSelectedDeviceEvent>(
      (event, emit) {
        final previousOnboardingData = state.onboardingData;
        emit(OnboardingSelectedDeviceUpdate(
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
            deviceUsageLimit: event.deviceUsageLimit ??
                previousOnboardingData.deviceUsageLimit,
            deviceMetaData: event.deviceMetaData,
          ),
        ));
      },
    );
    on<UpdateOnboardingPairDeviceEvent>(
      (event, emit) {
        final previousOnboardingData = state.onboardingData;
        emit(OnboardingPairDeviceUpdate(
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
            deviceUsageLimit: event.deviceUsageLimit ??
                previousOnboardingData.deviceUsageLimit,
            deviceMetaData:
                event.deviceMetaData ?? previousOnboardingData.deviceMetaData,
            deviceData: event.deviceData,
          ),
        ));
      },
    );
    on<UpdateOnboardingAppPermissionsEvent>(
      (event, emit) {
        final previousOnboardingData = state.onboardingData;
        emit(OnboardingAppPermissionDataUpdate(
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
            deviceUsageLimit: event.deviceUsageLimit ??
                previousOnboardingData.deviceUsageLimit,
            deviceMetaData:
                event.deviceMetaData ?? previousOnboardingData.deviceMetaData,
            deviceData: event.deviceData ?? previousOnboardingData.deviceData,
            appPermissions: event.appPermissions,
          ),
        ));
      },
    );

    on<ClearOnboardingDataEvent>(
      (event, emit) {
        emit(OnboardingDataClear(
          onboardingData: OnboardingData(),
        ));
      },
    );
  }
  @override
  void onChange(Change<OnboardingState> change) {
    debugPrint('OnboardingBloc state changed: $change');
    super.onChange(change);
  }
}
