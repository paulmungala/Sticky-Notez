import 'package:flutter/material.dart';
import 'package:my_quiz/ui/screens/OnboardingScreen/components/button.dart';
import 'package:my_quiz/ui/screens/SignInScreen/sign_in_screem.dart';
import 'package:my_quiz/utils/constants.dart';
import 'package:my_quiz/utils/size_config.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    required this.text,
    required this.image,
    required this.children,
    required this.isbutton,
  }) : super(key: key);
  final String text, image, isbutton;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          "Notez",
          style: TextStyle(
            fontSize: getPropotionateScreenWidth(36),
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: kPrimaryColor,
          ),
        ),
        const Spacer(flex: 2),
        Image.asset(
          image,
          height: getPropotionateScreenHeight(300),
          width: getPropotionateScreenWidth(275),
        ),
        // dot and buttons content
        SizedBox(
          height: getPropotionateScreenHeight(350),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getPropotionateScreenHeight(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: getPropotionateScreenHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                ),
                SizedBox(
                  height: getPropotionateScreenHeight(80),
                ),
                isbutton != "true"
                    ? const Text("")
                    : Button(
                        text: 'Get Started',
                        press: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
