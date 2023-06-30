import 'package:flutter/material.dart';

class MyHelpPage extends StatelessWidget {
  const MyHelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const SizedBox(height: 50),
        Row(
          children: const [
            Icon(Icons.arrow_back),
            Text("帮助手册", style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.none,
                color: Colors.white
            ),),
          ],
        ),

        const SizedBox(height: 20),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "使用说明",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.person_add),
                title: Text("注册"),
                subtitle: Text("用户可以通过注册来创建一个账户", style: TextStyle(
                  color: Colors.white38
                ),),
              ),
              const ListTile(
                leading: Icon(Icons.login),
                title: Text("登录"),
                subtitle: Text("用户可以通过登录来访问他们的账户", style: TextStyle(
                    color: Colors.white38
                ),),
              ),
              const ListTile(
                leading: Icon(Icons.info_outline),
                title: Text("查看任务详情"),
                subtitle: Text("用户可以查看任务的详细信息", style: TextStyle(
                    color: Colors.white38
                ),),
              ),
              const ListTile(
                leading: Icon(Icons.add),
                title: Text("新增任务"),
                subtitle: Text("用户可以添加新的任务", style: TextStyle(
                    color: Colors.white38
                ),),
              ),
              const ListTile(
                leading: Icon(Icons.edit),
                title: Text("编辑任务"),
                subtitle: Text("用户可以编辑已有的任务", style: TextStyle(
                    color: Colors.white38
                ),),
              ),
              const ListTile(
                leading: Icon(Icons.edit),
                title: Text("修改任务"),
                subtitle: Text("用户可以修改已有的任务", style: TextStyle(
                    color: Colors.white38
                ),),
              ),
              const ListTile(
                leading: Icon(Icons.delete),
                title: Text("删除任务"),
                subtitle: Text("用户可以删除已有的任务", style: TextStyle(
                    color: Colors.white38
                ),),
              ),
              const ListTile(
                leading: Icon(Icons.dashboard),
                title: Text("查看总体情况"),
                subtitle: Text("用户可以查看所有任务的总体情况", style: TextStyle(
                    color: Colors.white38
                ),),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
