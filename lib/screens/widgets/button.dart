import 'package:flutter/material.dart';
class DefaultButton extends StatelessWidget {
  Widget buttonWidget;
  Function() function;
  double width;
  Color? backgroundColor = Colors.pink;
  bool isUpperCase;
  double radius;
  double height;
  Color borderColor;
  DefaultButton({
    super.key,
    this.height = 50,
    required this.buttonWidget,
    required this.function,
    this.backgroundColor,
    this.width  = 150,
    this.isUpperCase = true,
    this.radius = 10.0,
    this.borderColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: buttonWidget,
      ),
    );
  }
}
/*
TableCalendar(
calendarFormat: CalendarFormat.week,
firstDay: DateTime.utc(2020, 1, 1),
lastDay: DateTime.utc(2030, 12, 31),
focusedDay: _focusedDay,
selectedDayPredicate: (day) {
return isSameDay(_selectedDay, day);
},
onDaySelected: (selectedDay, focusedDay) {
setState(() {
_selectedDay = selectedDay;
_focusedDay = focusedDay;
});
},
daysOfWeekStyle: DaysOfWeekStyle(
weekendStyle: TextStyle(
color: Colors.red, // لون أسماء أيام السبت والأحد
fontWeight: FontWeight.bold,
),
weekdayStyle: TextStyle(
color: Colors.white, // لون باقي أسماء الأيام
),
),
calendarStyle: CalendarStyle(
defaultTextStyle: TextStyle(
color: Colors.yellow, // لون النص الافتراضي للتواريخ
),
weekendTextStyle: TextStyle(
color: Colors.red, // لون النص لتواريخ السبت والأحد
),
todayDecoration: BoxDecoration(
color: Colors.blue, // خلفية اليوم الحالي
shape: BoxShape.circle,
),
selectedDecoration: BoxDecoration(
color: Colors.green, // خلفية اليوم المحدد
shape: BoxShape.circle,
),
),
),
 */
