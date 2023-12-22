import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState()) {
    on<OnboardingChooseCategoryEvent>((event, emit) async {
      emit(state.copyWith(status: OnboardingStatus.loading));
      emit(
        state.copyWith(
          status: OnboardingStatus.success,
          chosenCategory: event.category,
        ),
      );
    });

    on<OnboardingSubmitDataEvent>((event, emit) async {
      emit(state.copyWith(status: OnboardingStatus.loading));
      emit(
        state.copyWith(
          status: OnboardingStatus.success,
          firstName: event.firstName,
          lastName: event.lastName,
          career: event.career,
          skill: event.career,
        ),
      );
    });
  }
}
