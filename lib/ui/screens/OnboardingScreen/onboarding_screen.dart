import 'package:flutter/material.dart';
import 'package:my_quiz/ui/screens/OnboardingScreen/components/body.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}