import 'package:wdf_software/widgets/theme.dart';
import 'package:wdf_software/widgets/home/header.dart';
import 'package:wdf_software/pages/task/add_task.dart';
import 'package:wdf_software/pages/task/task_table.dart';

import 'package:flutter/material.dart';

// 定义主屏幕小部件
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            // 添加页眉部分
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: const [
                      // 添加“我的文件”和“我的文件”小部件
                      AddTaskPage(),
                      SizedBox(height: defaultPadding),
                      MyFiles(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}