import 'package:flutter/material.dart';
import 'package:ready/screens/screens/home.dart';
import 'package:ready/screens/screens/login.dart';
import 'package:ready/screens/screens/onboading.dart';
import 'package:ready/screens/screens/reqister.dart';
import 'package:ready/screens/screens/splash.dart';
import 'package:ready/screens/screens/start.dart';

class Routes {
  static const String splashRoute = '/';
  static const String startRoute = '/start';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String homeRoute = '/home';
  static const String onBoardingRoute = '/onBoarding';
}

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.startRoute:
        return MaterialPageRoute(builder: (_) => StartScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('NotFound'),
              ),
              body: const Center(
                child: Text('No Page'),
              ),
            ));
  }
}

void navigateToNextScreen(context, widget) =>
    Navigator.of(context).push(SliderRight(page: widget));

void navigateAndFinishThisScreen(context, widget) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );
void navigateAndReplace(context, widget) =>
    Navigator.pushReplacementNamed(context, widget);

class SliderRight extends PageRouteBuilder {
  final page;
  SliderRight({required this.page})
      : super(
            pageBuilder: (context, animation, animationTwo) => page,
            transitionsBuilder: (context, animation, animationTwo, child) {
              var begin = 0.0;
              var end = 1.0;
              var tween = Tween(begin: begin, end: end);
              var curvesAnimated =
                  CurvedAnimation(parent: animation, curve: Curves.linear);
              return ScaleTransition(
                scale: tween.animate(curvesAnimated),
                child: child,
              );
            });
}
