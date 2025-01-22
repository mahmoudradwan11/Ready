import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ready/core/mangers/values.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: AppColors.whiteColor,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: AppColors.defaultColor,
      fontSize: 20.0,
      fontWeight: AppFontWeight.font500,
    ),
    iconTheme: IconThemeData(
      color: AppColors.defaultColor,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.secColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor:AppColors.whiteColor,
    unselectedItemColor: AppColors.greyColor,
    elevation: 10.0,
    backgroundColor:HexColor('363636'),
  ),
  scaffoldBackgroundColor: AppColors.defaultColor,
);
