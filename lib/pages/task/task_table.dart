import 'package:wdf_software/models/MyTask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdf_software/pages/task/task_detail.dart';
import 'package:wdf_software/widgets/theme.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
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
        children: [
          Text(
            "我的任务",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              horizontalMargin: 0,
              columnSpacing: defaultPadding,
              columns: const [
                DataColumn(
                  label: Text("名称"),
                ),
                DataColumn(
                  label: Text("截止日期"),
                ),
                DataColumn(
                  label: Text("类别"),
                ),
              ],
              rows: List.generate(
                demoMyTask.length,
                    (index) => myTaskDataRow(context, demoMyTask[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow myTaskDataRow(BuildContext context, MyTask taskInfo) {
  return DataRow(
    cells: [
      DataCell(
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> TaskDetailPage(task: taskInfo),
              )
            );
          },
          child:  Row(
            children: [
              SvgPicture.asset(
                taskInfo.icon,
                height: 12,
                width: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(taskInfo.title),
              ),
            ],
          ),
        )

      ),
      DataCell(Text(taskInfo.deadline)),
      DataCell(Text(taskInfo.category)),
    ],
  );
}
