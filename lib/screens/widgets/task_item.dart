import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/core/models/task_model.dart';

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
          Text(model.title!,style: TextStyle(
              fontSize: AppFontSize.fontSize20,fontWeight: AppFontWeight.font600,
              color: AppColors.whiteColor
          ),),
          SizedBox(height: 5,),
          Text(model.subTitle!),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              if(model.time!=null)
                Text(DateFormat('yyyy-MM-dd').format(DateTime.parse(model.date!)),style: TextStyle(color: Colors.grey),),
              Text(' At ',style: TextStyle(color: Colors.grey),),
              if(model.time==null)
                Text('0'),
              if(model.date!=null)
                Text(model.time!,style: TextStyle(color: Colors.grey),),
              Spacer(),
              if(model.category!=null)
                Container(
                  color: Colors.cyan,
                  height: 20,
                  width: 100,
                  child: Center(child: Text(model.category!)),

                ),
              SizedBox(
                width: 10,
              ),
              if(model.priority!=null)
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
                      Text('${model.priority}'),
                    ],
                  ), // العلم والعد
                ),
            ],
          )
        ],
      ),
    ),
  ),
);