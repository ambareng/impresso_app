part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class OnboardingChooseCategoryEvent extends OnboardingEvent {
  final String category;

  const OnboardingChooseCategoryEvent({required this.category});

  @override
  List<Object> get props => [category];
}

class OnboardingSubmitDataEvent extends OnboardingEvent {
  final String firstName;
  final String lastName;
  final String career;
  final String skill;

  const OnboardingSubmitDataEvent(
      {required this.firstName,
      required this.lastName,
      required this.career,
      required this.skill});

  @override
  List<Object> get props => [firstName, lastName, career, skill];
}
