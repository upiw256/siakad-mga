import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sistem_akademik/UI/login.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        nextScreen: Login(),
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Color(0xFFFFF1BD),
      ),
    );
  }
}
