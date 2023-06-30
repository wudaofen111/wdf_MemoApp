class MyTask {
  final title, category, description, deadline, icon;
  final int id;

  MyTask(
      {
        required this.id,  //任务编号
        required this.title,  //任务标题
        required this.category,  //任务所属类别（学习/工作/锻炼/其它）
        required this.description,  //任务描述
        required this.deadline,  //任务截止日期
        required this.icon  //任务图标（以分类来分）
      }
  );
}

List demoMyTask = [

  // MyTask(
  //   id: 4,
  //   title: "学习flutter",
  //   category: "学习",
  //   description: "",
  //   deadline: "2023-06-29",
  //   icon: "assets/icons/Documents.svg",
  // ),
  MyTask(
    id: 1,
    title: "KD论文",
    category: "学习",
    description: "",
    deadline: "2023-07-05",
    icon: "assets/icons/Documents.svg",
  ),
  MyTask(
    id: 2,
    title: "党员大会",
    category: "工作",
    description: "",
    deadline: "2023-07-06",
    icon: "assets/icons/one_drive.svg",
  ),
  MyTask(
    id: 3,
    title: "跑1公里",
    category: "锻炼",
    description: "",
    deadline: "2023-07-07",
    icon: "assets/icons/google_drive.svg",
  ),

  MyTask(
    id: 5,
    title: "打球",
    category: "锻炼",
    description: "",
    deadline: "2023-07-07",
    icon: "assets/icons/google_drive.svg",
  ),
  MyTask(
    id: 6,
    title: "聚餐",
    category: "其它",
    description: "",
    deadline: "2023-07-09",
    icon: "assets/icons/drop_box.svg",
  ),
  MyTask(
    id: 7,
    title: "打扫卫生",
    category: "其它",
    description: "",
    deadline: "2023-07-09",
    icon: "assets/icons/drop_box.svg",
  )
];
