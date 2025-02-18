part of 'onboarding_bloc.dart';

sealed class OnboardingState {
  final OnboardingData onboardingData;
  const OnboardingState({required this.onboardingData});
}

final class OnboardingInitial extends OnboardingState {
  OnboardingInitial() : super(onboardingData: OnboardingData());
}

final class OnboardingDataProfileDetailsUpdate extends OnboardingState {
  @override
  final OnboardingData onboardingData;

  OnboardingDataProfileDetailsUpdate({required this.onboardingData})
      : super(onboardingData: onboardingData);
}

final class OnboardingDataGoalsUpdate extends OnboardingState {
  @override
  final OnboardingData onboardingData;

  OnboardingDataGoalsUpdate({required this.onboardingData})
      : super(onboardingData: onboardingData);
}

final class OnboardingSelectedDeviceUpdate extends OnboardingState {
  @override
  final OnboardingData onboardingData;

  OnboardingSelectedDeviceUpdate({required this.onboardingData})
      : super(onboardingData: onboardingData);
}

final class OnboardingPairDeviceUpdate extends OnboardingState {
  @override
  final OnboardingData onboardingData;

  OnboardingPairDeviceUpdate({required this.onboardingData})
      : super(onboardingData: onboardingData);
}

final class OnboardingAppPermissionDataUpdate extends OnboardingState {
  @override
  final OnboardingData onboardingData;

  OnboardingAppPermissionDataUpdate({required this.onboardingData})
      : super(onboardingData: onboardingData);
}
