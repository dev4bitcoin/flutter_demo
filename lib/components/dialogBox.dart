// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/mybutton.dart';

class DialogBox extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  VoidCallback onAdd;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onAdd,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter task name", border: OutlineInputBorder()),
              controller: controller,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, top: 15, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyButton(text: "Add", onPressed: onAdd),
                  MyButton(text: "Cancel", onPressed: onCancel)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
