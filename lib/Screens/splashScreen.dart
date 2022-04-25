import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Screens/findPets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
      backgroundColor: Color.fromARGB(255, 240, 237, 237),
      nextScreen: FindPets(),
      duration: 2500,
      splash: Image.asset('assets/dpg.png'),
      splashIconSize: 250.0,
      splashTransition: SplashTransition.sizeTransition,
    ));
  }
}
