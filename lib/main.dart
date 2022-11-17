import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/screens/SplashScreen/splash_screen.dart';
import 'utils/theme.dart';

void main() {
  // restrict rotation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notez',
      theme: theme(),
      home: const SplashScreen(),
    );
  }
}
