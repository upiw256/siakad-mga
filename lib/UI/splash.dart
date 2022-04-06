// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:sistem_akademik/UI/dashboard.dart';
import 'package:sistem_akademik/UI/login.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic token = FlutterSession().get("token");
    return Container(
      alignment: Alignment.topCenter,
      child: AnimatedSplashScreen(
        splash: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/logo.png'),
            Text(
              "SMAN 1 Margaasih",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        nextScreen: (token != '' ? Dashboard() : Login()),
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Color(0xFFFFF1BD),
      ),
    );
  }
}
