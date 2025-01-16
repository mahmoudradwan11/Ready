import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/images_manger.dart';
import 'package:ready/core/mangers/routes.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:svg_flutter/svg.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key,}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  _startTimer(){
    _timer = Timer(const Duration(seconds: AppValues.timer),_goNext);
  }

  _goNext(){
    navigateAndReplace(context,nextScreen);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor:AppColors.defaultColor,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.appIcon)
              ]
          ),
        )
    );
  }
  @override
  void dispose() {
     _timer!.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
