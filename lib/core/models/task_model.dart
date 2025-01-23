import 'package:hive_flutter/hive_flutter.dart';
part 'task_model.g.dart';
@HiveType(typeId: 0)
class TaskModel extends HiveObject{
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? subTitle;
  @HiveField(2)
  String? date;
  @HiveField(3)
  String? time;
  @HiveField(4)
  int? priority;
  @HiveField(5)
  String? category;
  @HiveField(6)
  String ? color;
  @HiveField(7)
  String? type;
  TaskModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.time,
    required this.priority,
    required this.category,
    required this.color,
    required this.type,
  });
}