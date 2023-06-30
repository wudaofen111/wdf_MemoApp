import 'package:wdf_software/widgets/theme.dart';
import 'package:flutter/material.dart';

class TaskKindInfo {
  final String iconSrc, title, totalTasks;
  final int numOfTasks, percentage;
  final Color color;

  TaskKindInfo(
      {required this.iconSrc,
      required this.title,
      required this.totalTasks,
      required this.numOfTasks,
      required this.percentage,
      required this.color});
}

List demoMyTasks = [
  TaskKindInfo(
    title: "学习",
    numOfTasks: 1,
    iconSrc: "assets/icons/Documents.svg",
    totalTasks: "10项",
    color: primaryColor,
    percentage: 20,
  ),
  TaskKindInfo(
    title: "工作",
    numOfTasks: 1,
    iconSrc: "assets/icons/one_drive.svg",
    totalTasks: "10项",
    color: const Color(0xFFA4CDFF),

    percentage: 10,
  ),
  TaskKindInfo(
    title: "锻炼",
    numOfTasks: 2,
    iconSrc: "assets/icons/google_drive.svg",
    totalTasks: "10项",
    color: const Color(0xFFFFA113),
    percentage: 20,
  ),
  TaskKindInfo(
    title: "其它",
    numOfTasks: 3,
    iconSrc: "assets/icons/drop_box.svg",
    totalTasks: "10项",
    color: const Color(0xFF506E86),
    percentage: 30,
  ),
];
