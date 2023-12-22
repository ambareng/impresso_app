part of 'onboarding_bloc.dart';

enum OnboardingStatus { initial, loading, success, failure }

class OnboardingState extends Equatable {
  final OnboardingStatus status;
  final String? chosenCategory;
  final String? firstName;
  final String? lastName;
  final String? career;
  final String? skill;

  const OnboardingState({
    this.status = OnboardingStatus.initial,
    this.chosenCategory,
    this.firstName,
    this.lastName,
    this.career,
    this.skill,
  });

  @override
  List<Object?> get props => [
        status,
        chosenCategory,
        firstName,
        lastName,
        career,
        skill,
      ];

  OnboardingState copyWith({
    OnboardingStatus? status,
    String? chosenCategory,
    String? firstName,
    String? lastName,
    String? career,
    String? skill,
  }) {
    return OnboardingState(
      status: status ?? this.status,
      chosenCategory: chosenCategory ?? this.chosenCategory,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      career: career ?? this.career,
      skill: skill ?? this.skill,
    );
  }
}
