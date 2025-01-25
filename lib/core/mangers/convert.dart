import 'package:flutter/material.dart';

String timeToString(TimeOfDay timeOfDay) {
  return '${timeOfDay.hour}:${timeOfDay.minute.toString().padLeft(2, '0')}';
}
String colorToString(Color color) {
  return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
}