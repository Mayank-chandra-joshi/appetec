part of 'onboarding_bloc.dart';

sealed class OnboardingState {
  final OnboardingData onboardingData;
  const OnboardingState({required this.onboardingData});
}

final class OnboardingInitial extends OnboardingState {
  OnboardingInitial() : super(onboardingData: OnboardingData());
}

final class OnboadingDataUpdate extends OnboardingState {
  @override
  final OnboardingData onboardingData;

  OnboadingDataUpdate({required this.onboardingData})
      : super(onboardingData: onboardingData);
}
