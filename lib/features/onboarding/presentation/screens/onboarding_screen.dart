import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:impresso_app/core/dependency_injector.dart';
import 'package:impresso_app/core/utils/media_query.dart';
import 'package:impresso_app/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:impresso_app/features/onboarding/presentation/widgets/first_screen.dart';
import 'package:impresso_app/features/onboarding/presentation/widgets/second_screen.dart';
import 'package:impresso_app/features/onboarding/presentation/widgets/third_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;
  int totalIndex = 3;

  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChangedFunc(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  void previousFunction() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  final onboardingBloc = sl<OnboardingBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => onboardingBloc,
        child: Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            PageView(
              controller: _pageController,
              onPageChanged: onPageChangedFunc,
              children: [
                FirstScreen(
                  onTapFunc: nextFunction,
                ),
                SecondScreen(
                  onBack: previousFunction,
                  onNext: nextFunction,
                  onboardingBloc: onboardingBloc,
                ),
                ThirdScreen(
                  onBack: previousFunction,
                  onNext: nextFunction,
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              top: height(context, 0.05),
              child: Center(
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey.withOpacity(0.35),
                  value: (currentIndex + 1) / (totalIndex + 1),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
