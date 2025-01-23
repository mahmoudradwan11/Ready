import 'package:flutter/material.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/core/models/task_model.dart';
/*
Widget buildTaskItem(TaskModel model)=> Padding(
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
          Text('1',style: TextStyle(
              fontSize: AppFontSize.fontSize20,fontWeight: AppFontWeight.font600,
              color: AppColors.whiteColor
          ),),
          SizedBox(height: 5,),
          Text('2'),
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
)
 */