import 'package:flutter/material.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/values.dart';

Widget buildProfileItem(text,icon)=>Row(
  children: [
    Icon(icon,color: AppColors.whiteColor,),
    SizedBox(
      width: 8,
    ),
    Text(text,style: TextStyle(color:AppColors.whiteColor,
        fontSize: AppFontSize.fontSize15)),
    Spacer(),
    Icon(Icons.arrow_forward_rounded,color: AppColors.whiteColor,),
  ],
);