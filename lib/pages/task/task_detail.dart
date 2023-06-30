import 'package:wdf_software/models/MyTask.dart';
import 'package:wdf_software/widgets/responsive.dart';
import 'package:wdf_software/widgets/task/task_detail.dart';
import 'package:wdf_software/widgets/theme.dart';
import 'package:flutter/material.dart';

// 定义主屏幕小部件
class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({super.key, required MyTask task});

  // final MyTask task;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "任务详情",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: TextDecoration.none
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const SizedBox(height: defaultPadding),

                      // 如果当前设备是移动设备，则在小部件之间添加间距
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      // 如果当前设备是移动设备，则添加存储详情小部件
                      if (Responsive.isMobile(context)) const TaskDetail(),
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