import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/core/controllers/Task_cubit/task_cubit.dart';
import 'package:ready/core/controllers/Task_cubit/task_states.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/models/task_model.dart';
import 'package:ready/screens/widgets/button.dart';
import 'package:ready/screens/widgets/custom.dart';

class EditTasks extends StatefulWidget {
  EditTasks({Key? key, required this.taskModel}) : super(key: key);
  final TaskModel taskModel;

  @override
  State<EditTasks> createState() => _EditTasksState();
}

class _EditTasksState extends State<EditTasks> {
  String? title, subTitle , cate,type;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskStates>(
        listener: (context, state) {},
        builder: (context, state) {
          TaskCubit cubit = TaskCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Edit Note'),
            ),
              body: Column(
                children: [
                  CustomTextFiled(
                      hintText:widget.taskModel.title!,onChanged:(value){
                    title = value;
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                      hintText:widget.taskModel.subTitle!, maxLines: 5,onChanged:(value){
                    subTitle = value;
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                      hintText:widget.taskModel.type!,
                      maxLines: 1,onChanged:(value){
                    type = value;
                  }),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultButton(
                      radius: 5,
                      isUpperCase: true,
                      width: double.infinity,
                      buttonWidget: Text(
                        'Edit Task',
                        style: TextStyle(color:AppColors.whiteColor),
                      ),
                       function: () {
                         widget.taskModel.title = title?? widget.taskModel.title;
                         widget.taskModel.type = type?? widget.taskModel.type;
                         widget.taskModel.subTitle = subTitle?? widget.taskModel.subTitle;
                         widget.taskModel.save();
                         cubit.getAllTasks();

                         Navigator.pop(context);

                       },
                      backgroundColor:AppColors.thirdColor,
                    ),
                  ),
                ],
              ),

          );
        }
    );
  }
}
