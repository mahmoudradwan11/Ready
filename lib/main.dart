import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ready/core/controllers/Task_cubit/task_cubit.dart';
import 'package:ready/core/controllers/login_cubit/login_cubit.dart';
import 'package:ready/core/controllers/obs.dart';
import 'package:ready/core/controllers/ready_controller/ready_cubit.dart';
import 'package:ready/core/controllers/register_cubit/register_cubit.dart';
import 'package:ready/core/controllers/user_controller/user_cubit.dart';
import 'package:ready/core/mangers/routes.dart';
import 'package:ready/core/mangers/themes.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/core/models/task_model.dart';
import 'package:ready/screens/screens/splash.dart';
import 'core/controllers/onboarding_controller/onboarding_cubit.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('Tasks');
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  if (board != null) {
    nextScreen = Routes.startRoute;
  } else {
    nextScreen = Routes.onBoardingRoute;
  }
  nationalId = CacheHelper.getData(key: 'userId');
  board = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  print('Token = $token');
  print('National Id = $nationalId');
  print('Boarding =$board');
  if (board != null) {
    if (token != null) {
        nextScreen = Routes.homeRoute;
      } else {
      nextScreen = Routes.startRoute;
    }
  }else{
    nextScreen=Routes.onBoardingRoute;
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
        BlocProvider(
          create: (context) => TaskCubit()..getAllTasks(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => LoginCubit()..checkLoginBotton(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => RegisterCubit()..checkRegisterBotton(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => UserCubit()..getUserData(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => ReadyCubit(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ready',
        initialRoute: Routes.splashRoute,
        onGenerateRoute: RouteGenerator.getRoutes,
        theme: lightTheme,
        home:SplashScreen(),
      ),
    );
  }
}
