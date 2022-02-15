import 'package:flutter/material.dart';
import 'package:pharus/constant/colors.dart';
import 'package:splashscreen/splashscreen.dart';

import 'onboard.dart';

class SplashScreens extends StatefulWidget {
  static const id = 'SplashScreens';
  const SplashScreens({Key key}) : super(key: key);

  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new OnboardingScreen(),
      title: new Text(
        'Welcome In Pharus',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image(
        image: AssetImage('images/undraw_vr_chat_4.png'),
        fit: BoxFit.fill,
      ),
      backgroundColor: Colors.white,
      loaderColor: primaryColor,
    );
  }
}
