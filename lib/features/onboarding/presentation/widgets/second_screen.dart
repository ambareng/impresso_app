import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:impresso_app/core/constants/colors.dart';
import 'package:impresso_app/core/utils/media_query.dart';
import 'package:impresso_app/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:impresso_app/features/onboarding/presentation/widgets/onboarding_button.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    Key? key,
    required this.onBack,
    required this.onNext,
    required this.onboardingBloc,
  }) : super(key: key);

  final VoidCallback onNext;
  final VoidCallback onBack;
  final OnboardingBloc onboardingBloc;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController careerController;
  late TextEditingController skillController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    careerController = TextEditingController();
    skillController = TextEditingController();

    firstNameController.text = widget.onboardingBloc.state.firstName ?? '';
    lastNameController.text = widget.onboardingBloc.state.lastName ?? '';
    careerController.text = widget.onboardingBloc.state.career ?? '';
    skillController.text = widget.onboardingBloc.state.skill ?? '';
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    careerController.dispose();
    skillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        widget.onBack();
      },
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: height(context, 1),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height(context, 0.065),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: widget.onBack,
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 30,
                    color: mainColor,
                  ),
                ),
              ),
              SizedBox(
                height: height(context, 0.01),
              ),
              Container(
                width: width(context, 0.85),
                height: height(context, 0.225),
                decoration: BoxDecoration(
                  color: const Color(0xFFC4CACC),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Image.asset('assets/images/camera.png'),
              ),
              SizedBox(
                height: height(context, 0.015),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: OnboardingField(
                        label: 'Your First Name',
                        placeholder: 'First Name',
                        controller: firstNameController,
                      ),
                    ),
                    SizedBox(
                      width: width(context, 0.025),
                    ),
                    Expanded(
                      child: OnboardingField(
                        label: 'Your Last Name',
                        placeholder: 'Last Name',
                        controller: lastNameController,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      OnboardingField(
                        label: 'Your Career Industry',
                        placeholder: 'Your Career Industry',
                        controller: careerController,
                      ),
                      SizedBox(
                        height: height(context, 0.015),
                      ),
                      OnboardingField(
                        label: 'Your Top Skill',
                        placeholder: 'Your Top Skill',
                        controller: skillController,
                      ),
                      const Spacer(),
                      OnboardingButton(
                        title: 'Next',
                        onTapFunc: () {
                          BlocProvider.of<OnboardingBloc>(context)
                              .add(OnboardingSubmitDataEvent(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            career: careerController.text,
                            skill: skillController.text,
                          ));
                          widget.onNext();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingField extends StatelessWidget {
  const OnboardingField({
    super.key,
    required this.placeholder,
    required this.label,
    required this.controller,
  });

  final String label;
  final String placeholder;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Color(0xFF79747E),
          ),
        ),
        hintText: placeholder,
      ),
    );
  }
}
