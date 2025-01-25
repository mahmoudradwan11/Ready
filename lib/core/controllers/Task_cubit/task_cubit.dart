import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ready/core/controllers/Task_cubit/task_states.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/lists.dart';
import 'package:ready/core/models/task_model.dart';
import 'package:ready/screens/widgets/button.dart';
import 'package:ready/screens/widgets/toast.dart';

class TaskCubit extends Cubit<TaskStates> {
  TaskCubit() : super(TaskInitState());
  static TaskCubit get(context) => BlocProvider.of(context);
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();
  int? selectedCategory;
  String? selectedColor;
  int? selectedPriority;
  TaskModel? taskModel;
  var pageController = PageController();
  void selectPriority(index, context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: AppColors.defaultColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Task Priority",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          selectedPriority = index + 1;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedPriority == index + 1
                                ? Colors.purple // لون مميز عند الضغط
                                : Colors.grey[800], // اللون الافتراضي
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.flag,
                                  color: selectedPriority == index + 1
                                      ? Colors.white
                                      : Colors.grey[400],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    color: selectedPriority == index + 1
                                        ? Colors.white
                                        : Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: AppColors.primeColor),
                        ),
                      ),
                      DefaultButton(
                          backgroundColor: AppColors.primeColor,
                          buttonWidget: Text(
                            "Save",
                            style: TextStyle(color: AppColors.whiteColor),
                          ),
                          function: () {
                            if (selectedPriority != null) {
                              emit(ChooseTaskPriority());
                              pageController.nextPage(duration: const Duration(
                                milliseconds: 750,
                              ),
                            curve: Curves.fastLinearToSlowEaseIn);
                              print("Selected Priority: $selectedPriority");
                            }
                            Navigator.of(context).pop();
                          })
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
  void selectCategory(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: AppColors.defaultColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Choose Category",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Divider(thickness: 1, color: Colors.grey[700]),
                  SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          selectedCategory = index;
                          emit(ChooseTaskCategory());
                          if(selectedCategory==0){
                            selectedColor = 'green';
                          }
                          if(selectedCategory==1){
                            selectedColor = 'orange';
                          }
                          if(selectedCategory==2){
                            selectedColor = 'cyan';
                          }
                          if(selectedCategory==3){
                            selectedColor = 'pinkAccent';

                          }
                          if(selectedCategory==4){
                            selectedColor ='blue';
                          }
                          if(selectedCategory==5){
                            selectedColor = 'pink';
                          }
                          if(selectedCategory==6){
                            selectedColor = 'purple';
                          }
                          if(selectedCategory==7){
                            selectedColor = 'lightGreen';

                          }
                          if(selectedCategory==8){
                            selectedColor = 'lightBlue';
                          }
                          if(selectedCategory==9){
                            selectedColor = 'orangeAccent';

                          }
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: selectedCategory == index
                                    ? categories[index]['color']
                                    : Colors.grey[800],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                categories[index]['icon'],
                                color: selectedCategory == index
                                    ? Colors.white
                                    : categories[index]['color'],
                                size: 32,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              categories[index]['label'],
                              style: TextStyle(
                                color: selectedCategory == index
                                    ? categories[index]['color']
                                    : Colors.grey[400],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedCategory != null) {
                        print(
                            "Selected Category: ");
                      }
          print(
                "Selected color: $selectedColor");
                      Navigator.pop(context);
                      pageController.nextPage(duration: const Duration(
                        milliseconds: 750,
                      ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primeColor,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text("Save"),
                  ),
                ],
              ),
            ),
          );
        });
  }
  void selectDate(context) async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primeColor,
            colorScheme: ColorScheme.dark(primary: AppColors.primeColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    emit(ChooseTaskDate());
    if (selectedDate != null) {
      selectedTime = await showTimePicker(
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppColors.primeColor,
              colorScheme: ColorScheme.dark(primary: AppColors.primeColor),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        },
        context: context,
        initialTime: TimeOfDay.now(),
      );
      emit(ChooseTaskTime());
      pageController.nextPage(duration: const Duration(
        milliseconds: 750,
      ),
          curve: Curves.fastLinearToSlowEaseIn);
      print('Date: $selectedDate, Time: $selectedTime');
    }
  }
  void addTask(TaskModel task)async{
    emit(AddTaskInitData());
    try{
    var taskBox = Hive.box<TaskModel>('Tasks');
    await taskBox.add(task);
    emit(AddTaskData());
    showToast('Added',ToastStates.SUCCESS);
    getAllTasks();
  }catch(error){
      print(error.toString());
      emit(ErrorAddTaskData());
    }
    }
  List<TaskModel> tasks = [];
  void getAllTasks()async{
    emit(GetTaskInitData());
    try{
      var taskBox = Hive.box<TaskModel>('Tasks');
      tasks = taskBox.values.toList();
      emit(GetTaskData());
      print(tasks.length);
    }catch(error){
      print(error.toString());
      emit(ErrorGetTaskData());
    }
  }

}
