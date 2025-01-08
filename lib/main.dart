import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/core/mangers/routes.dart';
import 'package:ready/core/mangers/themes.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/screens/screens/splash.dart';
import 'core/controllers/onboarding_controller/onboarding_cubit.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/store/dio_helper.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  board = CacheHelper.getData(key: 'onBoarding');
  print('Boarding =$board');
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  if(board!=null) {
    nextScreen = Routes.userHomeRoute;
  }else{
    nextScreen = Routes.onBoardingRoute;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
          providers: [
          BlocProvider(
          create: (context) => OnboardingCubit(),
    lazy: true,
    ),
    ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ready',
        initialRoute: Routes.splashRoute,
        onGenerateRoute: RouteGenerator.getRoutes,
        theme: lightTheme,
        home: SplashScreen(),
      ),
    );
  }
}

