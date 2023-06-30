import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wdf_software/models/MyTask.dart';

class MyTaskDatabase {
  static final MyTaskDatabase instance = MyTaskDatabase._init();

  static Database? _database;

  MyTaskDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    // 获取数据库路径
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'mytasks.db');

    // 打开或创建数据库
    _database = await openDatabase(path, version: 1, onCreate: _createDB);
    return _database!;
  }

  // 创建MyTask表
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE MyTask (
        id INTEGER PRIMARY KEY,
        title TEXT,
        category TEXT,
        description TEXT,
        deadline TEXT,
        icon TEXT
      )
    ''');

    // 将demoMyTask中的数据插入到表中
    for (final task in demoMyTask) {
      await db.insert('MyTask', task.toMap());
    }
  }

  // 获取所有任务
  Future<List<MyTask>> getAllTasks() async {
    final db = await instance.database;

    // 查询MyTask表中的所有数据
    final maps = await db.query('MyTask');

    // 将查询结果转换成MyTask对象列表
    return List.generate(maps.length, (i) {
      return MyTask.fromMap(maps[i]);
    });
  }

  // 根据任务所属类别获取任务列表
  Future<List<MyTask>> getTasksByCategory(String category) async {
    final db = await instance.database;

    // 查询MyTask表中category字段等于传入参数的数据
    final maps = await db.query('MyTask', where: 'category = ?', whereArgs: [category]);

    // 将查询结果转换成MyTask对象列表
    return List.generate(maps.length, (i) {
      return MyTask.fromMap(maps[i]);
    });
  }

  // 根据任务名称进行模糊搜索
  Future<List<MyTask>> searchTasks(String keyword) async {
    final db = await instance.database;

    // 查询MyTask表中title字段包含传入参数的数据（忽略大小写）
    final maps = await db.query('MyTask', where: 'title LIKE ?', whereArgs: ['%$keyword%']);

    // 将查询结果转换成MyTask对象列表
    return List.generate(maps.length, (i) {
      return MyTask.fromMap(maps[i]);
    });
  }

  // 根据任务编号获取任务
  Future<MyTask> getTaskById(int id) async {
    final db = await instance.database;

    // 查询MyTask表中id字段等于传入参数的数据
    final maps = await db.query('MyTask', where: 'id = ?', whereArgs: [id]);

    // 将查询结果转换成MyTask对象
    return MyTask.fromMap(maps.first);
  }

  // 创建任务
  Future<int> createTask(MyTask task) async {
    final db = await instance.database;

    // 插入新任务数据到MyTask表中
    return await db.insert('MyTask', task.toMap());
  }

  // 更新任务
  Future<int> updateTask(MyTask task) async {
    final db = await instance.database;

    // 更新MyTask表中id字段等于传入参数任务编号的数据
    return await db.update('MyTask', task.toMap(),
        where: 'id = ?', whereArgs: [task.id]);
  }

  // 删除任务
  Future<int> deleteTask(int id) async {
    final db = await instance.database;

    // 删除MyTask表中id字段等于传入参数的数据
    return await db.delete('MyTask', where: 'id = ?', whereArgs: [id]);
  }
}

// MyTask类代表MyTask表中的一行数据
class MyTask {
  final int id;  // 任务编号
  final String title;  // 任务标题
  final String category;  // 任务所属类别（学习/工作/锻炼/其它）
  final String description;  // 任务描述
  final String deadline;  // 任务截止日期
  final String icon;  // 任务图标（以分类来分）

  MyTask({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.deadline,
    required this.icon,
  });

  // 将MyTask对象转换成Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'deadline': deadline,
      'icon': icon,
    };
  }

  // 从Map中创建MyTask对象
  factory MyTask.fromMap(Map<String, dynamic> map) {
    return MyTask(
      id: map['id'],
      title: map['title'],
      category: map['category'],
      description: map['description'],
      deadline: map['deadline'],
      icon: map['icon'],
    );
  }
}