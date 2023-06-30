import 'package:wdf_software/pages/home/addComplete.dart';
import 'package:wdf_software/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wdf_software/widgets/theme.dart';

import 'package:wdf_software/database/taskdb.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  // 初始化数据库
  // final dbHelper = DatabaseHelper.instance;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "添加任务",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                  defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  useRootNavigator: true,
                  builder: (context) => AlertDialog(
                    backgroundColor: bgColor,
                    title: const Text('添加任务'),
                    content: SizedBox(
                      height: 360,
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          children: [
                            SizedBox(
                              child: TextFormField(
                                controller: _titleController,
                                decoration:
                                const InputDecoration(labelText: '任务名称'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '请输入任务名称';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: _categoryController,
                                decoration:
                                const InputDecoration(labelText: '任务类别'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '请输入任务类别';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: _descriptionController,
                                decoration:
                                const InputDecoration(labelText: '任务描述'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '请输入任务描述';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('任务截止日期: '),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Colors.blueGrey,
                                    ),
                                    onPressed: () {
                                      _selectDate(context);
                                    },
                                    child: Text(DateFormat('yyyy-MM-dd')
                                        .format(_selectedDate)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!
                                          .validate()) {
                                        // 构造一个新的 MyTask 对象
                                        final newTask = MyTask(
                                          title: _titleController.text,
                                          category: _categoryController.text,
                                          description:
                                          _descriptionController.text,
                                          deadline: DateFormat('yyyy-MM-dd')
                                              .format(_selectedDate),
                                          icon: '', id: 1,
                                        );
                                        // 将任务插入数据库
                                        // await database.insertTask(newTask);
                                        // 返回到前一个页面
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context)=> const AddComplete(),
                                            )
                                        );
                                      }
                                    },
                                    child: const Text('添加'),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepOrange,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('取消'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text("添加新任务"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}



