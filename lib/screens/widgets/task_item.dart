import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/convert.dart';
import 'package:ready/core/mangers/routes.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/core/models/task_model.dart';
import 'package:ready/screens/screens/task_detials.dart';

Widget buildTaskItem(TaskModel model,context)=> GestureDetector(
  onTap:(){
    navigateToNextScreen(context,TaskDetials(taskModel: model));
  },
  child: Padding(
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
                  Text(convertTimeTo12Hour(model.time!),style: TextStyle(color: Colors.grey),),
                Spacer(),
                if(model.category!=null&&model.category=='Grocery')
                  Container(
                    color:Colors.green,
                    height: 20,
                    width: 100,
                    child: Center(child: Text(model.category!)),
                  ),
                if(model.category!=null&&model.category=='Work')
                  Container(
                    color:Colors.orangeAccent,
                    height: 20,
                    width: 100,
                    child: Center(child: Text(model.category!)),
                  ),
                if(model.category!=null&&model.category=='Sport')
                  Container(
                    color:Colors.cyan,
                    height: 20,
                    width: 100,
                    child: Center(child: Text(model.category!)),
                  ),
                if(model.category!=null&&model.category=='Design')
                  Container(
                    color:Colors.pinkAccent,
                    height: 20,
                    width: 100,
                    child: Center(child: Text(model.category!)),
                  ),
                if(model.category!=null&&model.category=='University')
                  Container(
                    color:Colors.blue,
                    height: 20,
                    width: 100,
                    child: Center(child: Text(model.category!)),
                  ),
                if(model.category!=null&&model.category=='Social')
                  Container(
                    color:Colors.pink,
                    height: 20,
                    width: 100,
                    child: Center(child: Text(model.category!)),
                  ),
                if(model.category!=null&&model.category=='Music')
                  Container(
                    color:Colors.purple,
                    height: 20,
                    width: 100,
                    child: Center(child: Text(model.category!)),
                  ),
                if(model.category!=null&&model.category=='Health')
                  Container(
                    color:Colors.lightGreen,
                    height: 20,
                    width: 100,
                    child: Center(child: Text(model.category!)),
                  ),
                if(model.category!=null&&model.category=='Movie')
                  Container(
                    color:Colors.lightBlue,
                    height: 20,
                    width: 100,
                    child: Center(child: Text(model.category!)),
                  ),
                if(model.category!=null&&model.category=='Home')
                  Container(
                    color:Colors.orangeAccent,
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
  ),
);