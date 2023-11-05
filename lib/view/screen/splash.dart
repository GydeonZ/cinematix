import 'package:flutter/material.dart';
import 'package:praktikum/view/screen/onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnboardingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'CINEMATIX',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w400,
            fontFamily: 'Mortend',
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
