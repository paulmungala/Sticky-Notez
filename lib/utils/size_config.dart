import 'package:flutter/material.dart';

//this is the size configurations for various the measurements of widgets in the app
class SizeConfig {
  static MediaQueryData _mediaQueryData = _mediaQueryData;
  static double screenWidth = screenWidth;
  static double screenHeight = screenHeight;
  static double defaultSize = defaultSize;
  static Orientation orientation = orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// get the propotionate height as per screen size
double getPropotionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the size screen height of a design
  return (inputHeight / 812.0) * screenHeight;
}

//get the propotionate width as per screen size
double getPropotionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  //375 is size screen width of a design
  return (inputWidth / 375.0) * screenWidth;
}
