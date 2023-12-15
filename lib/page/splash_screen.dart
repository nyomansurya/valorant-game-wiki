import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_valorantagent/page/home_screen/home_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#0F1923'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/App Logo.png',
              width: 200,
            ),
            SizedBox(height: 30),
            const Text(
              'Valorant Game Wiki',
              style: TextStyle(
                fontFamily: 'Valorant',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}
