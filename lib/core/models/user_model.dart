class UserModel {
  String? status;
  String? message;
  UserData? user;
  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }
}

class UserData {
  String? name;
  String? email;
  String? phone;
  String? nationalId;
  String? gender;
  String? token;
  String? profileImage;

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    nationalId = json['nationalId'];
    gender = json['gender'];
    token = json['token'];
    profileImage = json['profileImage'];
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
            todayTextStyle: TextStyle(color:Colors.pink),
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