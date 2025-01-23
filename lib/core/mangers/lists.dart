import 'package:flutter/material.dart';
import 'package:ready/core/mangers/images_manger.dart';
import 'package:ready/core/models/OnBoardingModel.dart';
import 'package:ready/screens/screens/add.dart';
import 'package:ready/screens/screens/calender.dart';
import 'package:ready/screens/screens/fouces.dart';
import 'package:ready/screens/screens/login.dart';
import 'package:ready/screens/screens/profile.dart';
import 'package:ready/screens/screens/tasks.dart';

List<OnBoardingModel> onboarding = [
  OnBoardingModel(
      title: 'Manage your task',
      body: 'You can easily manage all of your daily tasks in Dome for free.'),
  OnBoardingModel(
      title: 'Create daily routine',
      body:
          'In Uptodo you can create your personalized routine to stay active'),
  OnBoardingModel(
      title: 'Organize your tasks',
      body:
          'you can organize your daily tasks by adding your task into separate categories'),
];
List<OnBoardingImages> onBoardingImages = [
  OnBoardingImages(image: AppImages.onBoarding1),
  OnBoardingImages(image: AppImages.onBoarding2),
  OnBoardingImages(image: AppImages.onBoarding3),
];
List<Widget> screens=[
  TasksScreen(),
  CalenderScreen(),
  AddTasksScreen(),
  FoucesScreen(),
  ProfileScreen(),
];
List<IconData>icons=[
  Icons.home,
  Icons.calendar_today,
  Icons.add,
  Icons.timer,
  Icons.person,
];
final List<Map<String, dynamic>> categories = [
  {"icon": Icons.local_grocery_store, "label": "Grocery", "color": Colors.green},
  {"icon": Icons.work, "label": "Work", "color": Colors.orange},
  {"icon": Icons.fitness_center, "label": "Sport", "color": Colors.cyan},
  {"icon": Icons.design_services, "label": "Design", "color": Colors.pinkAccent},
  {"icon": Icons.school, "label": "University", "color": Colors.blue},
  {"icon": Icons.speaker, "label": "Social", "color": Colors.pink},
  {"icon": Icons.music_note, "label": "Music", "color": Colors.purple},
  {"icon": Icons.favorite, "label": "Health", "color": Colors.lightGreen},
  {"icon": Icons.movie, "label": "Movie", "color": Colors.lightBlue},
  {"icon": Icons.home, "label": "Home", "color": Colors.orangeAccent},
];
