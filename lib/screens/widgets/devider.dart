import 'package:flutter/material.dart';

Widget dividerWithText(text) {
  return Row(
    children: [
      Expanded(
        child: Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          text,
          style: TextStyle(color: Colors.grey),
        ),
      ),
      Expanded(
        child: Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ),
    ],
  );
}