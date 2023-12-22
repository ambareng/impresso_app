import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:impresso_app/core/constants/colors.dart';
import 'package:impresso_app/core/utils/media_query.dart';
import 'package:impresso_app/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:impresso_app/features/onboarding/presentation/widgets/onboarding_button.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({
    super.key,
    required this.onBack,
    required this.onNext,
  });

  final VoidCallback onNext;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) => onBack(),
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: height(context, 1),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height(context, 0.065),
                  ),
                  IconButton(
                    onPressed: onBack,
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      size: 30,
                      color: mainColor,
                    ),
                  ),
                  SizedBox(
                    height: height(context, 0.01),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: width(context, 0.85),
                      height: height(context, 0.225),
                      decoration: BoxDecoration(
                        color: const Color(0xFFC4CACC),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Image.asset('assets/images/camera.png'),
                    ),
                  ),
                  SizedBox(
                    height: height(context, 0.015),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OnboardingText(
                          label: 'First Name: ',
                          value: state.firstName ?? '',
                        ),
                        SizedBox(
                          height: height(context, 0.015),
                        ),
                        OnboardingText(
                          label: 'Last Name: ',
                          value: state.lastName ?? '',
                        ),
                        SizedBox(
                          height: height(context, 0.015),
                        ),
                        OnboardingText(
                          label: 'Career Industry: ',
                          value: state.career ?? '',
                        ),
                        SizedBox(
                          height: height(context, 0.015),
                        ),
                        OnboardingText(
                          label: 'Top Skill: ',
                          value: state.skill ?? '',
                        ),
                        SizedBox(
                          height: height(context, 0.035),
                        ),
                        OnboardingText(
                          label: 'You are here for: ',
                          value: state.chosenCategory ?? '',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: OnboardingButton(
                      title: 'Submit',
                      onTapFunc: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class OnboardingText extends StatelessWidget {
  const OnboardingText({
    super.key,
    required this.value,
    required this.label,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: label,
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
