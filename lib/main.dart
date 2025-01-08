import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ready/core/mangers/routes.dart';
import 'package:ready/core/mangers/themes.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/screens/screens/splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  nextScreen = Routes.onBoardingRoute;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ready',
        initialRoute: Routes.splashRoute,
        onGenerateRoute: RouteGenerator.getRoutes,
      theme: lightTheme,
      home: SplashScreen(),
    );
  }
}

