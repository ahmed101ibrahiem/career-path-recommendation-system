import 'package:flutter/material.dart';
import 'package:pharus/controllers/auth_controller.dart';
import 'package:pharus/my_dio/my_dio.dart';
import 'package:pharus/shared_pref/shared_pref.dart';
import 'package:pharus/ui/screens/career_detail.dart';
import 'package:pharus/ui/screens/courses/course_detail.dart';
import 'package:pharus/ui/screens/recommend_Career.dart';
import 'package:pharus/ui/screens/results.dart';
import 'package:pharus/ui/screens/splash_screen.dart';
import 'package:pharus/ui/screens/success2.dart';
import 'package:provider/provider.dart';
import 'controllers/career_controller.dart';
import 'ui/screens/courses/CoursesNames.dart';
import 'ui/screens/job_zone_screen.dart';
import 'ui/screens/login.dart';
import 'ui/screens/onboard.dart';
import 'ui/screens/questionnaire_page/realistic.dart';
import 'ui/screens/register.dart';
import 'ui/screens/success.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MyDio().init();
  SharedPref.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => AuthController()),
        ),
        ChangeNotifierProvider(
          create: ((context) => CareerController()),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.teal,
            // drawerTheme: DrawerThemeData(
            //   backgroundColor: Colors.redAccent
            // )
          ),
          home: SplashScreens(),
          routes: {
            Login.id: (context) => Login(),
            Success.id: (context) => Success(),
            SuccessTwo.id: (context) => SuccessTwo(),
            Register.id: (context) => Register(),
            OnboardingScreen.id: (context) => OnboardingScreen(),
            SplashScreens.id: (context) => SplashScreens(),
            Result.id: (context) => Result(),
            // RecommendCareer.id: (context) => RecommendCareer(),
            Realistic.id: (context) => Realistic(),
            // JobZoneScreen.id: (context) => JobZoneScreen(),
            CareerDetails.id: (context) => CareerDetails(),
            CoursesNames.id: (context) => CoursesNames(),
            courseDetail.id: (context) => courseDetail(),
          }),
    );
  }
}
