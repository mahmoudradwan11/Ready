import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ready/core/controllers/Task_cubit/task_cubit.dart';
import 'package:ready/core/controllers/Task_cubit/task_states.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/convert.dart';
import 'package:ready/core/models/task_model.dart';
import 'package:ready/screens/widgets/button.dart';
import 'package:ready/screens/widgets/task_details_item.dart';
import 'package:ready/screens/widgets/toast.dart';

class TaskDetials extends StatelessWidget {
  TaskDetials({Key? key,required this.taskModel}) : super(key: key);
  TaskModel? taskModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit,TaskStates>(
      listener:(context,state){},
      builder:(context,state){
        TaskCubit cubit = TaskCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.defaultColor,
            leading: IconButton(onPressed:(){}, icon:Icon(Icons.close,color: AppColors.whiteColor,)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildSpecificationDetialsItem(
                  title: 'Title',
                  subTitle: taskModel!.title!,
                  darkBackGroundColor:AppColors.primeColor,
                ),
                SizedBox(
                  height: 10,
                ),
                BuildSpecificationDetialsItem(
                  title: 'Description',
                  contentHight: taskModel!.subTitle!.length>=30?80:50,
                  subTitle: taskModel!.subTitle!,
                  darkBackGroundColor:AppColors.fieldColor,
                ),
                SizedBox(
                  height: 10,
                ),
                BuildSpecificationDetialsItem(
                  title: 'Time',
                  subTitle:convertTimeTo12Hour(
                      taskModel!.time!),
                  darkBackGroundColor:AppColors.primeColor,
                ),
                SizedBox(
                  height: 10,
                ),
                BuildSpecificationDetialsItem(
                  title: 'Date',
                  subTitle:DateFormat('yyyy-MM-dd').format(DateTime.parse(taskModel!.date!),),
                  darkBackGroundColor:AppColors.fieldColor,
                ),
                SizedBox(
                  height: 10,
                ),
                BuildSpecificationDetialsItem(
                  title: 'Category',
                  subTitle:taskModel!.category!,
                  darkBackGroundColor:AppColors.primeColor,
                ),
                SizedBox(
                  height: 10,
                ),
                BuildSpecificationDetialsItem(
                  title: 'Priority',
                  subTitle:taskModel!.priority!.toString(),
                  darkBackGroundColor:AppColors.fieldColor,
                ),
                SizedBox(
                  height: 10,
                ),
                BuildSpecificationDetialsItem(
                  title: 'Status',
                  subTitle: taskModel!.type!,
                  darkBackGroundColor:AppColors.primeColor,
                ),
                SizedBox(
                  height: 5,
                ),
                DefaultButton(buttonWidget:Row(
                  children: [
                    Icon(Icons.delete_outline_outlined,color: Colors.red,),
                    SizedBox(width: 5,),
                    Text('Delete Task',style: TextStyle(color:Colors.red),)
                  ],
                ),
                    function:(){
                  Navigator.pop(context);
                  taskModel!.delete();
                  showToast('Delete',ToastStates.SUCCESS);
                  cubit.getAllTasks();
                    }),
                Spacer(),
            DefaultButton(
              radius: 5,
              isUpperCase: true,
              width: double.infinity,
              buttonWidget: Text(
                'Edit Task',
                style: TextStyle(color:AppColors.whiteColor),
              ),
              function: () {
               // navigateAndReplace(context, Routes.loginRoute);
              },
              backgroundColor:AppColors.thirdColor,
            ),
              ],
            ),
          ),

        );
      },

    );
  }
}
