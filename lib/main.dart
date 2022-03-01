import 'package:flutter/material.dart';
import 'package:pharus/ui/screens/recommendJob.dart';
import 'package:pharus/ui/screens/results.dart';
import 'package:pharus/ui/screens/splash_screen.dart';
import 'ui/screens/job_zone_screen.dart';
import 'ui/screens/login.dart';
import 'ui/screens/onboard.dart';
import 'ui/screens/questionnaire.dart';
import 'ui/screens/register.dart';
import 'ui/screens/success.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: SplashScreens(),
        routes: {
          Login.id: (context) => Login(),
          Success.id: (context) => Success(),
          Register.id: (context) => Register(),
          OnboardingScreen.id: (context) => OnboardingScreen(),
          SplashScreens.id: (context) => SplashScreens(),
          Result.id: (context) => Result(),
          RecommendJobs.id: (context) => RecommendJobs(),
          Questionnaire.id: (context) => Questionnaire(),
          JobZoneScreen.id: (context) => JobZoneScreen(),
        });
  }
}
