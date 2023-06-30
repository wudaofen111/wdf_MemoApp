import 'package:flutter/material.dart';
import 'package:wdf_software/widgets/chart/task_kind_chart.dart';
import 'package:wdf_software/widgets/theme.dart';
import 'task_info_card.dart';

class TaskShowPage extends StatelessWidget {
  const TaskShowPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "任务可视化展示",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              decoration: TextDecoration.none
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            iconSrc: "assets/icons/Documents.svg",
            title: "学习",
            amountOfTasks: "10项",
            numOfTasks: 1,
            color: primaryColor,
          ),
          StorageInfoCard(
            iconSrc: "assets/icons/one_drive.svg",
            title: "工作",
            amountOfTasks: "10项",
            numOfTasks: 1,
            color: Color(0xFFA4CDFF),
          ),
          StorageInfoCard(
            iconSrc: "assets/icons/google_drive.svg",
            title: "锻炼",
            amountOfTasks: "10项",
            numOfTasks: 2,
            color: Color(0xFFFFA113),
          ),
          StorageInfoCard(
            iconSrc: "assets/icons/drop_box.svg",
            title: "其它",
            amountOfTasks: "20项",
            numOfTasks: 2,
            color: Color(0xFF506E86),
          ),
        ],
      ),
    );
  }
}
