import 'package:flutter/material.dart';
import 'package:impresso_app/core/constants/strings.dart';
import 'package:impresso_app/core/utils/media_query.dart';
import 'package:impresso_app/features/auth/presentation/widgets/auth_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      Container(
        width: double.infinity,
        height: height(context, 1),
        color: Colors.white,
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Opacity(
          opacity: 0.3,
          child: Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: height(context, 1),
          child: Column(
            children: [
              SizedBox(
                height: height(context, 0.10),
              ),
              Image.asset(logoPath),
              SizedBox(
                height: height(context, 0.025),
              ),
              SizedBox(
                width: width(context, 0.75),
                child: const Text(
                  'Career Meetups with Professionals Near You',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: height(context, 0.35),
              ),
              const Text(
                'CONTINUE WITH',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: height(context, 0.025),
              ),
              const Text(
                'You last logged in with Facebook',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0x66000000),
                ),
              ),
              SizedBox(
                height: height(context, 0.015),
              ),
              const AuthButton(
                title: 'Apple ID',
                imagePath: applePath,
              ),
              SizedBox(
                height: height(context, 0.01),
              ),
              const AuthButton(
                title: 'Google Account',
                imagePath: googlePath,
              ),
              SizedBox(
                height: height(context, 0.01),
              ),
              const AuthButton(
                title: 'Facebook',
                imagePath: facebookPath,
              ),
              SizedBox(
                height: height(context, 0.015),
              ),
              SizedBox(
                  width: width(context, 0.65),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'By joining or using IMPRESSO you agree with the '),
                        TextSpan(
                          text: 'T&C',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        TextSpan(text: ', '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Cookie Policy',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    ]));
  }
}
