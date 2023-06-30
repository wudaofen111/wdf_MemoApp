import 'package:flutter/material.dart';
import 'package:wdf_software/pages/task/edit_task.dart';
import 'package:wdf_software/widgets/chart/task_complete_chart.dart';
import 'package:wdf_software/widgets/theme.dart';

class TaskSearch extends StatelessWidget {
  const TaskSearch({
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
            "学习flutter",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                decoration: TextDecoration.none
            ),
          ),
          SizedBox(height: defaultPadding),
          TaskDetailChart(),
          TaskDetailForm(category: '学习', description: '撸起袖子加油干', deadline: '2023-06-29',),
        ],
      ),
    );
  }
}


class TaskDetailForm extends StatelessWidget {
  final String category;
  final String description;
  final String deadline;

  const TaskDetailForm({
    Key? key,
    required this.category,
    required this.description,
    required this.deadline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "类别：",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                category,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
        Container(
          width: 300,
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "描述：",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
        Container(
          width: 300,
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "截止日期：",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                deadline,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditTaskPage()),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text("编辑"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.delete),
              label: const Text("取消"),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.deepOrange),
              ),
            ),
          ],
        ),
      ],
    );
  }
}