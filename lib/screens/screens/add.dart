import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:ready/core/controllers/Task_cubit/task_cubit.dart';
import 'package:ready/core/controllers/Task_cubit/task_states.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/convert.dart';
import 'package:ready/core/mangers/lists.dart';
import 'package:ready/core/mangers/lottie.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/core/models/task_model.dart';
import 'package:ready/screens/widgets/button.dart';
import 'package:ready/screens/widgets/text_form_feild.dart';

class AddTasksScreen extends StatefulWidget {
  AddTasksScreen({super.key});

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskStates>(
        listener: (context, state) {},
        builder: (context, state) {
          TaskCubit cubit = TaskCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.defaultColor,
              title: Text(
                'Add Task',
                style: TextStyle(color: AppColors.whiteColor),
              ),
              centerTitle: true,
            ),
            body: PageView(
              controller: cubit.pageController,
                onPageChanged: (int index) {
                  if (index == 1) {
                    cubit.selectDate(context);
                  }
                  if (index == 2) {
                    cubit.selectPriority(index, context);
                  }
                  if (index == 3) {
                    cubit.selectCategory(context);
                  }
                },
                children: [
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            DefaultFieldForm(
                              controller: cubit.titleController,
                              keyboard: TextInputType.text,
                              valid: (value) {},
                              label: 'Task Name',
                              labelStyle: TextStyle(color: AppColors.primeColor),
                              hintStyle: TextStyle(
                                  color: AppColors.greyColor,
                                  fontSize: AppFontSize.fontSize15),
                              hint: 'Enter Task Title',
                              prefix: Icons.task,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DefaultFieldForm(
                              controller: cubit.subtitleController,
                              keyboard: TextInputType.text,
                              valid: (value) {},
                              label: 'Description',
                              labelStyle: TextStyle(color: AppColors.primeColor),
                              hintStyle: TextStyle(
                                  color: AppColors.greyColor,
                                  fontSize: AppFontSize.fontSize15),
                              hint: 'Task Description',
                              prefix: Icons.description,
                            ),
                            Lottie.asset(AppAnimation.task),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text('Selected Time'),
                  Text('Selected Proirty'),
                  Text('Selected Category'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Task Details',style: TextStyle(color: AppColors.primeColor,fontSize: AppFontSize.fontSize20),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height:100,
                          width: double.infinity,
                          color: AppColors.fieldColor,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Text(cubit.titleController.text,style: TextStyle(
                                  fontSize: AppFontSize.fontSize20,fontWeight: AppFontWeight.font600,
                                color: AppColors.whiteColor
                              ),),
                              SizedBox(height: 5,),
                              Text(cubit.subtitleController.text),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  if(cubit.selectedTime!=null)
                                      Text(DateFormat('yyyy-MM-dd').format(cubit.selectedDate!),style: TextStyle(color: Colors.grey),),
                                  Text(' At ',style: TextStyle(color: Colors.grey),),
                                  if(cubit.selectedTime==null)
                                    Text('0'),
                                  if(cubit.selectedDate!=null)
                                    Text(timeToString(cubit.selectedTime!),style: TextStyle(color: Colors.grey),),
                                  if(cubit.selectedDate==null)
                                    Text('0'),
                                  Spacer(),
                                  if(cubit.selectedCategory!=null)
                                  Container(
                                    color: Colors.cyan,
                                    height: 20,
                                    width: 100,
                                    child: Center(child: Text('${categories[cubit.selectedCategory!]['label']}')),

                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  if(cubit.selectedPriority!=null)
                                  Container(
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: AppColors.primeColor),

                                    ),
                                    height: 20,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('${cubit.selectedPriority}'),
                                      ],
                                    ), // العلم والعد
                        ),
                                ],
                              )
                            ],
                          ),
                        ),
                        ),
                        ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(100.0),
                        child: DefaultButton(buttonWidget: Text('AddTask'), function:(){
                          cubit.addTask(TaskModel(
                              title:cubit.titleController.text,
                              subTitle: cubit.subtitleController.text,
                              date:cubit.selectedDate.toString(),
                              time:timeToString(cubit.selectedTime!),
                              priority:cubit.selectedPriority,
                              category:categories[cubit.selectedCategory!]['label'],
                              color:'Cyan',
                              type:'Active'
                          ));
                        },
                          backgroundColor: AppColors.primeColor,
                        ),
                      )
                    ],
                  ),
                ]),
          );
        });
  }
}
