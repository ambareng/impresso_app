import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:impresso_app/core/constants/categories.dart';
import 'package:impresso_app/core/constants/colors.dart';
import 'package:impresso_app/core/constants/strings.dart';
import 'package:impresso_app/core/utils/media_query.dart';
import 'package:impresso_app/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:impresso_app/features/onboarding/presentation/widgets/onboarding_button.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    super.key,
    required this.onTapFunc,
  });

  final VoidCallback onTapFunc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height(context, 0.065),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 30,
                    color: mainColor,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "I'm here for",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    color: mainColor,
                  ),
                )
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio:
                      width(context, 0.15) / height(context, 0.115),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    title: categories[index],
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: OnboardingButton(title: 'Skip', onTapFunc: onTapFunc),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<OnboardingBloc>(context)
            .add(OnboardingChooseCategoryEvent(category: title));
      },
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: Colors.black,
                          width: state.chosenCategory == title ? 2 : 1),
                      bottom: BorderSide.none,
                      left: BorderSide(
                          color: Colors.black,
                          width: state.chosenCategory == title ? 2 : 1),
                      right: BorderSide(
                          color: Colors.black,
                          width: state.chosenCategory == title ? 2 : 1),
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      categoryPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide.none,
                      bottom: BorderSide(
                          color: Colors.black,
                          width: state.chosenCategory == title ? 2 : 1),
                      left: BorderSide(
                          color: Colors.black,
                          width: state.chosenCategory == title ? 2 : 1),
                      right: BorderSide(
                          color: Colors.black,
                          width: state.chosenCategory == title ? 2 : 1),
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF1D1B20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
