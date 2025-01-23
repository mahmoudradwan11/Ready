import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/core/controllers/Task_cubit/task_cubit.dart';
import 'package:ready/core/controllers/Task_cubit/task_states.dart';
import 'package:ready/core/controllers/user_controller/user_cubit.dart';
import 'package:ready/core/controllers/user_controller/user_states.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/images_manger.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/screens/widgets/task_item.dart';
import 'package:svg_flutter/svg.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tasks',
          style: TextStyle(color:AppColors.whiteColor),
        ),
        backgroundColor: AppColors.defaultColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocConsumer<UserCubit,UserStates>(
              listener:(context,state){},
              builder:(context,state){
               UserCubit cubit =  UserCubit.get(context);
                return cubit.userModel==null?
                CircleAvatar(
                    radius: 20,
                    child: ClipOval(
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                AppImages.userNotImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                ) : CircleAvatar(
                radius: 20,
                child: ClipOval(
                child: Container(
                decoration: BoxDecoration(
                image: DecorationImage(
                image: NetworkImage(cubit.userModel!.user!.profileImage!),
                fit: BoxFit.fill,
                ),
                ),
                ),
                ),
                );
              },
            ),
          )
        ],
      ),
      body:BlocConsumer<TaskCubit,TaskStates>(
        listener:(context,state){},
      builder:(context,state){
          TaskCubit cubit =  TaskCubit.get(context);
        return cubit.tasks.isEmpty?
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.emptyTask),
                Text('What do you want to do today?',style: TextStyle(color: AppColors.whiteColor,fontSize: AppFontSize.fontSize20),),
                SizedBox(height: 10,),
                Text('Tap + to add your tasks',style: TextStyle(color: AppColors.greyColor),)

              ],
            ),
          )
        ):ListView.builder(
            itemBuilder:(context,index)=>buildTaskItem(cubit.tasks[index]),
            itemCount: cubit.tasks.length,
        );
      },
    ),
    );
  }
}
