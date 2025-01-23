import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/core/controllers/user_controller/user_cubit.dart';
import 'package:ready/core/controllers/user_controller/user_states.dart';
import 'package:ready/core/mangers/images_manger.dart';

import '../../core/mangers/colors.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                return cubit.userModel!.user!.profileImage==null?
                CircleAvatar(
                    radius: 20,
                    child: ClipOval(
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                AppImages.userNotImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                )
                    : CircleAvatar(
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
      body: Center(
    child:Text('Tasks',style: TextStyle(color: Colors.white),)
    ),
    );
  }
}
