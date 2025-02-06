import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:ready/core/controllers/Task_cubit/task_cubit.dart';
import 'package:ready/core/controllers/Task_cubit/task_states.dart';
import 'package:ready/core/controllers/user_controller/user_cubit.dart';
import 'package:ready/core/controllers/user_controller/user_states.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/screens/widgets/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {},
      builder: (context, state) {
        UserCubit cubit = UserCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.defaultColor,
            title: Text(
              'Profile',
              style: TextStyle(color: AppColors.whiteColor),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(cubit.userModel!.user!.profileImage!),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      cubit.userModel!.user!.name!,
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppFontSize.fontSize20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocConsumer<TaskCubit, TaskStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              TaskCubit taskCubit = TaskCubit.get(context);
                              return Container(
                                height: 60,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: HexColor('363636'),
                                ),
                                child: Center(
                                    child: Text(
                                  '${taskCubit.tasks.length} Tasks left',
                                  style: TextStyle(color: AppColors.whiteColor),
                                )),
                              );
                            },
                          ),
                          BlocConsumer<TaskCubit, TaskStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              TaskCubit taskCubit = TaskCubit.get(context);
                              return Container(
                                height: 60,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: HexColor('363636'),
                                ),
                                child: Center(
                                    child: Text(
                                        '${taskCubit.completeTasks.length} Tasks done',
                                      style: TextStyle(color: AppColors.whiteColor),
                                    )),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                    child: Text('Account',style: TextStyle(color: AppColors.greyColor),),
                  ),
                  InkWell(
                    onTap:(){},
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: buildProfileItem('Change account name',Icons.person)
                    ),
                  ),
                  InkWell(
                    onTap:(){},
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: buildProfileItem('Change account password',Icons.key)
                    ),
                  ),
                  InkWell(
                    onTap:(){},
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: buildProfileItem('Change account email',Icons.email)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                    child: Text('Uptodo',style: TextStyle(color: AppColors.greyColor),),
                  ),
                  InkWell(
                    onTap:(){},
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: buildProfileItem('About Us',Icons.account_tree_outlined)
                    ),
                  ),
                  InkWell(
                    onTap:(){},
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20.0,bottom: 20.0),
                        child: buildProfileItem('FAQ',Icons.question_mark)
                    ),
                  ),
                  InkWell(
                    onTap:(){},
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: buildProfileItem('Help and Feedback',Icons.help)
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
