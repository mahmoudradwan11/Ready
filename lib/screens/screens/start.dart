import 'package:flutter/material.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/routes.dart';
import 'package:ready/core/mangers/string.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/screens/widgets/button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 100, bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppString.startTitle,
              style: TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight:AppFontWeight.font900,
                  fontSize: AppFontSize.fontSize25),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppString.start,
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight:AppFontWeight.font100,
                    fontSize: AppFontSize.fontSize15),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DefaultButton(
                radius: 5,
                isUpperCase: true,
                width: double.infinity,
                buttonWidget: Text(
                  'LOGIN',
                  style: TextStyle(color:AppColors.whiteColor),
                ),
                function: () {
                  navigateAndReplace(context, Routes.loginRoute);
                },
                backgroundColor:AppColors.thirdColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: DefaultButton(
                  radius: 5,
                  borderColor:AppColors.thirdColor,
                  isUpperCase: true,
                  width: double.infinity,
                  buttonWidget: Text(
                    'CREATE ACCOUNT',
                    style: TextStyle(color:AppColors.whiteColor),
                  ),
                  function: () {
                    navigateAndReplace(context, Routes.registerRoute);
                  },
                  backgroundColor: Colors.transparent),
            )
          ],
        ),
      ),
    );
  }
}
