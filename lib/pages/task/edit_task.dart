import 'package:intl/intl.dart';
import 'package:wdf_software/widgets/theme.dart';
import 'package:flutter/material.dart';

class EditTaskPage extends StatefulWidget {
  const EditTaskPage({Key? key}) : super(key: key);


  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {

  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();

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
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "编辑任务",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: TextDecoration.none
              ),
            ),

            const SizedBox(height: 50),
            AlertDialog(
              backgroundColor: bgColor,
              title: const Text('编辑任务'),
              content: SizedBox(
                // width: 300,

                height: 360,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 500,
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: '任务名称'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '请输入任务名称';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 500,
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: '任务类别'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '请输入任务类别';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        // width: 500,
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: '任务描述'),
                          // maxLines: 3,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('截止日期：'),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey, // 设置背景颜色
                              ),
                              onPressed: () {
                                _selectDate(context);
                              },
                              child: Text(DateFormat('yyyy-MM-dd').format(_selectedDate)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(

                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // TODO: Submit form
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => const TaskDetailPage(task: myTask,)),
                                    // );
                                  }
                                },
                                child: const Text('保存'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepOrange, // 设置背景颜色
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(); // 返回到前一个页面
                                },
                                child: const Text('取消'),
                              ),
                            ],
                          )
                      )
                    ],
                  ),),


              ),
            )
          ],
        ),
      ),
    );
  }
}