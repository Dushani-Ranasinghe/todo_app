
import 'package:flutter/material.dart';
import 'task_buttons.dart';

class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final VoidCallback onCancel;
  final VoidCallback onSave;
  const DialogBox({ required this.controller, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      // title: "Create a new task",
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0),),
                hintText: "Add a new task",
                
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [MyButton(text: "Save", onPressed:onSave),
              SizedBox(width: 5.0,),
              MyButton(text: "Cancel", onPressed:onCancel)],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
