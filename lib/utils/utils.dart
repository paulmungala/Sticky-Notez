import 'package:flutter/foundation.dart';

class Utils {
  static void logger(String message) {
    //only output to console if debug mode is enabled
    if (kDebugMode) {
      print("==========================================");
      print(message);
      print("==========================================");
    }
  }
}
