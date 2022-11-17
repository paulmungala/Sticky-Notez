import 'package:flutter/material.dart';
import 'package:my_quiz/ui/screens/OnboardingScreen/components/onboarding_content.dart';
import 'package:my_quiz/utils/constants.dart';
import 'package:my_quiz/utils/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

int currentPage = 0;

class _BodyState extends State<Body> {
 
  // onboarding data
  List<Map<String, String>> onboardingData = [
    {
      "text": "Tired of sticky Notes?",
      "image": "assets/images/notes.png",
      "button": "false",
    },
    {
      "text": "Can't stay organised?",
      "image": "assets/images/notes2.png",
      "button": "false",
    },
    {
      "text": "Try Notez Today!",
      "image": "assets/images/notes3.png",
      "button": "true",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              // splash content
              SizedBox(
                height: getPropotionateScreenHeight(900),
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onboardingData.length,
                  itemBuilder: (BuildContext context, int index) =>
                      OnboardingContent(
                    text: onboardingData[index]["text"].toString(),
                    image: onboardingData[index]["image"].toString(),
                    isbutton: onboardingData[index]["button"].toString(),
                    children: List.generate(
                      onboardingData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method for building the dot when swipping the splash images
  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Colors.blueGrey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
