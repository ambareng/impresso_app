import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:impresso_app/core/routing/page_name.dart';
import 'package:impresso_app/core/utils/media_query.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.title, required this.imagePath});

  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.push(PageName.onboarding);
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        backgroundColor: const Color(0XFF434343),
        fixedSize: Size(width(context, 0.75), height(context, 0.06)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          SizedBox(
            width: width(context, 0.025),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFE5E5E5),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
