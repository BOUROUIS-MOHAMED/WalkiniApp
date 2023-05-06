import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TasksData {

  final String title;
  final int requiredPoints;
  final int collectedPoints;
  final IconData iconImage;

  TasksData(this.title, this.requiredPoints, this.iconImage, this.collectedPoints);
}

class DemoData{

  //how many points this user has earned, in a real app this would be loaded from an online service.
  int earnedPoints = 150;

  //List of available drinks
  List<TasksData> tasks = [
    TasksData("Walk for 30000KM", 30000,Icons.directions_walk_outlined,10000),
    TasksData("Walk for 31 day", 31, Icons.access_time_rounded,31),
    TasksData("Walk for 2h continually", 120, Icons.repeat,120),
    TasksData("Drink 4L a day", 4, Icons.water_drop_outlined,1),
    TasksData("Drink 4 cup daily for a week", 6, Icons.local_drink_outlined,5),
  ];

}
