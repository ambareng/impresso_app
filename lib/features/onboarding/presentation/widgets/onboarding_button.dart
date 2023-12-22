import 'package:flutter/material.dart';
import 'package:impresso_app/core/utils/media_query.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    super.key,
    required this.title,
    required this.onTapFunc,
  });

  final String title;
  final VoidCallback onTapFunc;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapFunc,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        backgroundColor: const Color(0XFF434343),
        fixedSize: Size(width(context, 0.75), height(context, 0.06)),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFE5E5E5),
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
