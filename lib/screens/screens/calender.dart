import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ready/core/controllers/Task_cubit/task_cubit.dart';
import 'package:ready/core/controllers/Task_cubit/task_states.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/screens/widgets/button.dart';
import 'package:ready/screens/widgets/task_item.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalenderScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit,TaskStates>(
        listener: (context, state) {},
        builder: (context, state) {
          TaskCubit cubit = TaskCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColors.defaultColor,
              title: Text(
                'Calender', style: TextStyle(color: AppColors.whiteColor),),
            ),
            body: Column(
              children: [
                Container(
                  color: HexColor('363636'),
                  child: TableCalendar(
                    calendarFormat: CalendarFormat.week,
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) {
                      return _selectedDay != null &&
                          isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                      weekdayStyle: TextStyle(color: Colors.white),
                    ),
                    calendarStyle: CalendarStyle(
                      holidayTextStyle: TextStyle(color: Colors.green),
                      defaultTextStyle: TextStyle(color: Colors.white),
                      weekendTextStyle: TextStyle(color: Colors.white),
                      todayDecoration: BoxDecoration(
                        color:AppColors.primeColor, shape: BoxShape.rectangle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: AppColors.primeColor,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                          color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.fieldColor,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DefaultButton(
                              borderColor:cubit.today?Colors.transparent:AppColors.whiteColor,
                              backgroundColor: cubit.today?AppColors.primeColor:Colors.transparent,
                              buttonWidget: Text('Today',style: TextStyle(color:AppColors.whiteColor)), function: (){
                                cubit.changeCateToToday();
                          }),
                          DefaultButton(
                              borderColor:cubit.today?AppColors.whiteColor:Colors.transparent,
                              backgroundColor: cubit.today?Colors.transparent:AppColors.primeColor,
                              buttonWidget: Text('Complete',style: TextStyle(color:AppColors.whiteColor),), function: (){
                                cubit.changeCateToComplete();
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                cubit.today?
                Expanded(
                  child: Padding(
                  padding: const EdgeInsets.only(bottom:80),
                        child: ListView.builder(
                        itemBuilder: (context, index) =>
                        buildTaskItem(cubit.pendingTasks[index],context),
                        itemCount: cubit.pendingTasks.length,
                        ),
                        ),
                )
                    :Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:80),
                        child: ListView.builder(
                          itemBuilder: (context, index) =>
                          buildTaskItem(cubit.completeTasks[index],context),
                          itemCount: cubit.completeTasks.length,
                        ),
                        ),
                    )

              ],
            ),

          );
        }
    );
  }
}
