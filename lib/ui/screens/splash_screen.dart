import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pharus/constant/colors.dart';
import 'package:pharus/controllers/auth_controller.dart';
import 'package:pharus/ui/screens/login.dart';
import 'package:pharus/ui/screens/success.dart';
import 'package:provider/provider.dart';
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
  void initState() {
    // TODO: implement initState

    Timer(const Duration(seconds: 3), () async {
      await Provider.of<AuthController>(context, listen: false).checkLogin()
          ? Navigator.pushReplacementNamed(context, Success.id)
          : Navigator.pushReplacementNamed(context, Login.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFA6E3E8),
              Color(0xFFE3FDFC),
            ],
          ),
        ),
        child: Center(
          child: Image.asset('images/logo.png'),
        ),
      ),
    );
  }
}
