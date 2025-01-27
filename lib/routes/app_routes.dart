import 'package:flutter/material.dart';
import 'package:trippr/screens/forgot_screen.dart';
import 'package:trippr/screens/home_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/intro_screen.dart';
import '../screens/sign_in_screen.dart';
import '../screens/sign_up_screen.dart';
import 'package:trippr/screens/wrapper.dart';

class AppRoutes {
  static const splash = '/';
  static const intro = '/intro';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const forgot = '/forgot';
  static const home = '/home';
  static const detail = '/detail';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    intro: (context) => IntroScreen(),
    signIn: (context) => SignInPage(),
    signUp: (context) => SignUpScreen(),
    forgot: (context) => ForgotScreen(),
    home: (context) => MainWrapper()
  };
}
