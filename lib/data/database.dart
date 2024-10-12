import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  static final TodoDatabase _instance = TodoDatabase();

  final box = Hive.box('myBox');

  static TodoDatabase getInstance() {
    return _instance;
  }

  List getTodoList() {
    return box.get('todoList', defaultValue: []);
  }

  void addTask(String taskName) {
    List todoList = getTodoList();
    todoList.add({"taskName": taskName, "taskCompleted": false});
    box.put('todoList', todoList);
  }

  void updateTask(int index, bool? value) {
    List todoList = getTodoList();
    todoList[index]["taskCompleted"] = value;
    box.put('todoList', todoList);
  }

  void deleteTask(int index) {
    List todoList = getTodoList();
    todoList.removeAt(index);
    box.put('todoList', todoList);
  }
}
