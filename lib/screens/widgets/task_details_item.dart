import 'package:flutter/material.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/values.dart';

class BuildSpecificationDetialsItem extends StatelessWidget {
  Color darkBackGroundColor;
  String title;
  double contentHight;
  String subTitle;
  BuildSpecificationDetialsItem({
    super.key,
    this.contentHight = 50,
    required this.title,
    required this.subTitle,
    required this.darkBackGroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: contentHight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: darkBackGroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: AppColors.defaultColor,
                    fontSize: AppFontSize.fontSize15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Text(subTitle,
                    style: TextStyle(
                        color: AppColors.defaultColor,
                        fontSize: AppFontSize.fontSize15,
                        fontWeight: FontWeight.w500)),
              ),
            )
          ],
        ),
      ),
    );
  }
}