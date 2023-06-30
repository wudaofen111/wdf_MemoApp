import 'package:wdf_software/pages/chart/tasks_kind_graph.dart';
import 'package:wdf_software/widgets/responsive.dart';
import 'package:wdf_software/widgets/theme.dart';
import 'package:wdf_software/pages/chart/task_chart.dart';

import 'package:flutter/material.dart';

// 定义主屏幕小部件
class GraphShowPage extends StatelessWidget {
  const GraphShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.arrow_back),
                Text(
                  "任务类别展示",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      decoration: TextDecoration.none
                  ),
                ),
              ],
            ),


            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const TaskCategoryPage(),
                      const SizedBox(height: defaultPadding),

                      // 如果当前设备是移动设备，则在小部件之间添加间距
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      // 如果当前设备是移动设备，则添加存储详情小部件
                      if (Responsive.isMobile(context)) const TaskShowPage(),
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