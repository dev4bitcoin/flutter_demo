// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/dialogBox.dart';
import 'package:flutter_application_1/components/todoTile.dart';
import 'package:flutter_application_1/data/database.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TextEditingController myController = TextEditingController();

  var database = TodoDatabase.getInstance();
  var todoList = [];

  @override
  void initState() {
    todoList = database.getTodoList();

    // TODO: implement initState
    super.initState();
  }

  checkboxChanged(bool? value, int index) {
    setState(() {
      database.updateTask(index, value);
    });
  }

  void onAdd() {
    setState(() {
      database.addTask(myController.text);
      myController.clear();
      Navigator.pop(context);
    });
  }

  void onCancel() {
    setState(() {
      myController.clear();
      Navigator.pop(context);
    });
  }

  void addNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: myController,
            onAdd: onAdd,
            onCancel: onCancel,
          );
        });
  }

  onDelete(int index) {
    print("Delete $index");
    setState(() {
      database.deleteTask(index);
      //Navigator.pop(p1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("TO DO"),
        backgroundColor: Colors.yellow[300],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: todoList[index]["taskName"],
              taskCompleted: todoList[index]["taskCompleted"],
              onChanged: (bool? value) => checkboxChanged(value, index),
              onDelete: (context) => onDelete(index),
            );
          }),
    );
  }
}
