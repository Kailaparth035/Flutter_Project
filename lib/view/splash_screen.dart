import 'package:flutter/material.dart';
import 'package:flutter_demo/view/onboarding_page.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToNewScreen(BuildContext context) {
    // Delay navigation by 3 seconds using onboarding screen
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(const OnBoardingPage());
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (context) => const OnBoardingPage()),
      // );
    });
  }

  @override
  void initState() {
    navigateToNewScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        "assets/images/spashScreen.jpg",
        height: 810,
        fit: BoxFit.cover,
      ),
    ));
  }
}
