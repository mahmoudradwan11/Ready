import 'package:flutter/material.dart';

String timeToString(TimeOfDay timeOfDay) {
  return '${timeOfDay.hour}:${timeOfDay.minute.toString().padLeft(2, '0')}';
}