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
import 'package:ready/screens/widgets/button.dart';
import 'package:ready/screens/widgets/profile.dart';
import 'package:ready/screens/widgets/text_form_feild.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {},
      builder: (context, state) {
        UserCubit cubit = UserCubit.get(context);
        var nameController = TextEditingController();
        var emailController = TextEditingController();
        var phoneController = TextEditingController();
        var model = cubit.userModel;
        nameController.text = model!.user!.name!;
        emailController.text = model.user!.email!;
        phoneController.text = model.user!.phone!;
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
                    onTap:(){
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: HexColor('363636'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                  'Change account name',
                                      style: TextStyle(
                                        fontSize: AppFontSize.fontSize15,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                    SizedBox(height:2),
                                    Container(height: 1,color: AppColors.greyColor,),
                                    SizedBox(height:10),
                                    DefaultFieldForm(
                                      controller: nameController,
                                      keyboard: TextInputType.name,
                                      valid: (value) {},
                                      prefix: Icons.person,
                                      hintStyle: const TextStyle(color: Colors.grey),
                                      labelStyle: TextStyle(color:AppColors.greyColor
                                    ),
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        DefaultButton(
                                          width: 120,
                                            backgroundColor: Colors.transparent,
                                            borderColor: AppColors.greyColor,
                                            buttonWidget: Text(
                                              "Cancel",
                                              style: TextStyle(color: AppColors.primeColor),
                                            ),
                                            function: () {
                                            Navigator.pop(context);
                                            }),
                                        DefaultButton(
                                            width: 120,
                                            backgroundColor: AppColors.primeColor,
                                            buttonWidget: Text(
                                              "Edit",
                                              style: TextStyle(color: AppColors.whiteColor),
                                            ),
                                            function: () {})
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: buildProfileItem('Change account name',Icons.person)
                    ),
                  ),
                  InkWell(
                    onTap:(){
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: HexColor('363636'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Change account password',
                                      style: TextStyle(
                                        fontSize: AppFontSize.fontSize15,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                    SizedBox(height:2),
                                    Container(height: 1,color: AppColors.greyColor,),
                                    SizedBox(height:10),
                                    DefaultFieldForm(
                                      controller: phoneController,
                                      keyboard: TextInputType.name,
                                      valid: (value) {},
                                      prefix: Icons.person,
                                      hintStyle: const TextStyle(color: Colors.grey),
                                      labelStyle: TextStyle(color:AppColors.greyColor
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        DefaultButton(
                                            width: 120,
                                            backgroundColor: Colors.transparent,
                                            borderColor: AppColors.greyColor,
                                            buttonWidget: Text(
                                              "Cancel",
                                              style: TextStyle(color: AppColors.primeColor),
                                            ),
                                            function: () {
                                              Navigator.pop(context);
                                            }),
                                        DefaultButton(
                                            width: 120,
                                            backgroundColor: AppColors.primeColor,
                                            buttonWidget: Text(
                                              "Edit",
                                              style: TextStyle(color: AppColors.whiteColor),
                                            ),
                                            function: () {})
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: buildProfileItem('Change account password',Icons.key)
                    ),
                  ),
                  InkWell(
                    onTap:(){
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: HexColor('363636'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Change account email',
                                      style: TextStyle(
                                        fontSize: AppFontSize.fontSize15,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                    SizedBox(height:2),
                                    Container(height: 1,color: AppColors.greyColor,),
                                    SizedBox(height:10),
                                    DefaultFieldForm(
                                      controller: emailController,
                                      keyboard: TextInputType.emailAddress,
                                      valid: (value) {},
                                      prefix: Icons.person,
                                      hintStyle: const TextStyle(color: Colors.grey),
                                      labelStyle: TextStyle(color:AppColors.greyColor
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        DefaultButton(
                                            width: 120,
                                            backgroundColor: Colors.transparent,
                                            borderColor: AppColors.greyColor,
                                            buttonWidget: Text(
                                              "Cancel",
                                              style: TextStyle(color: AppColors.primeColor),
                                            ),
                                            function: () {
                                              Navigator.pop(context);
                                            }),
                                        DefaultButton(
                                            width: 120,
                                            backgroundColor: AppColors.primeColor,
                                            buttonWidget: Text(
                                              "Edit",
                                              style: TextStyle(color: AppColors.whiteColor),
                                            ),
                                            function: () {})
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
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
