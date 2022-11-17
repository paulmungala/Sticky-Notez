import 'package:flutter/material.dart';
import 'package:my_quiz/utils/constants.dart';
import 'package:my_quiz/utils/size_config.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getPropotionateScreenWidth(56),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getPropotionateScreenWidth(18),
          ),
        ),
      ),
    );
  }
}
