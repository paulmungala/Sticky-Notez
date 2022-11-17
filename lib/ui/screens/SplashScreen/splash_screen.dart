import 'package:flutter/material.dart';
import 'package:my_quiz/ui/screens/HomeScreen/home_screen.dart';
import 'package:my_quiz/ui/screens/OnboardingScreen/onboarding_screen.dart';
import 'package:my_quiz/utils/constants.dart';
import 'package:my_quiz/utils/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // log in state
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    getPrefs();
    navigate();
  }

  // get prefs
  Future getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasPrefs = prefs.containsKey('loggedIn');
    if (hasPrefs == true) {
      setState(() {
        isLoggedIn = true;
      });
    } else if (hasPrefs == false) {
      setState(() {
        isLoggedIn = false;
      });
    }
  }
  // for navigating
  Future navigate() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});

    //navigation
    if (isLoggedIn == true) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else if (isLoggedIn == false) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Text(
            'Notez',
            style: TextStyle(
                fontSize: getPropotionateScreenWidth(25),
                fontWeight: FontWeight.bold,
                color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
