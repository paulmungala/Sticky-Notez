import 'package:flutter/material.dart';
import 'package:my_quiz/ui/screens/OnboardingScreen/onboarding_screen.dart';
import 'package:my_quiz/ui/screens/SignInScreen/components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const OnboardingScreen(),
              ),
            );
          },
        ),
        title: const Text("Sign In"),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
