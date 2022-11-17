import 'package:flutter/material.dart';
import 'package:my_quiz/ui/screens/SignInScreen/components/sign_in_form.dart';
import 'package:my_quiz/utils/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getPropotionateScreenWidth(20),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: getPropotionateScreenHeight(60)),
                Text(
                  "Welcome!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getPropotionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Enter your Email and Pasword \nto Sign In.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: getPropotionateScreenWidth(12)),
                ),
                SizedBox(
                  height: getPropotionateScreenHeight(100),
                ),
                //form
                const SignInForm(),
                SizedBox(
                  height: getPropotionateScreenHeight(20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}