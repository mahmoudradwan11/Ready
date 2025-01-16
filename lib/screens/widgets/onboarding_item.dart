import 'package:flutter/material.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/core/models/OnBoardingModel.dart';
import 'package:svg_flutter/svg.dart';

Widget buildOnBoardingItem(OnBoardingModel model) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            model.title!,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: AppFontSize.fontSize30),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                model.body!,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: AppFontSize.fontSize15),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]);
Widget buildOnBoardingImage(OnBoardingImages image) =>
    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: 300,
        width: double.infinity,
        child: SvgPicture.asset(image.image!),
      ),
    ]);
