import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//best practice
import 'constants.dart';

//overall theme
ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Nunito",
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: kPrimaryColor,
    ),
    appBarTheme: appBarTheme(),
    textTheme: texttTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

//theme that will be used for text fields in the app
InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 20,
    ),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
    labelStyle: TextStyle(
      color: kPrimaryColor,
    ),
  );
}

//theme that will be used for texts in the app
TextTheme texttTheme() {
  return TextTheme(
    bodyText1: TextStyle(
      color: kTextColor,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    bodyText2: TextStyle(
      color: kTextColor,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
  );
}

//theme that will be used for the top bar of screens in the app
AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      iconTheme: const IconThemeData(color: Colors.black),
      toolbarTextStyle: const TextTheme(
        headline6: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontFamily: "Nunito",
          fontWeight: FontWeight.w600,
        ),
      ).bodyText2,
      titleTextStyle: const TextTheme(
        headline6: TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontFamily: "Nunito",
          fontWeight: FontWeight.w600,
        ),
      ).headline6);
}
