import 'package:wdf_software/widgets/responsive.dart';
import 'package:wdf_software/widgets/task/search_task.dart';
import 'package:wdf_software/widgets/theme.dart';
import 'package:flutter/material.dart';

// 定义主屏幕小部件
class SearchTaskPage extends StatelessWidget {
  const SearchTaskPage({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "任务搜索情况",
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
                      if (Responsive.isMobile(context)) const TaskSearch(),
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