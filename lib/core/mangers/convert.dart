import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String timeToString(TimeOfDay timeOfDay) {
  return '${timeOfDay.hour}:${timeOfDay.minute.toString().padLeft(2, '0')}';
}
String colorToString(Color color) {
  return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
}

String convertTimeTo12Hour(String time) {
  DateTime dateTime = DateFormat('HH:mm').parse(time);
  String timeIn12 = DateFormat('hh:mm a').format(dateTime);
  return timeIn12;
}
