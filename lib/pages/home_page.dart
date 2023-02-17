import 'package:flutter/material.dart';

import '../util/todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List todoList = [
    ["Make tutorials", false],
    ["Bake a cake", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            // title: "Create a new task",
            content: Container(
              height: 120,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0),),
                      hintText: "Add a new task",
                      
                    ),
                  ),
                  Row()
                ],
              ),
            ),
            backgroundColor: Colors.white,
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 241, 241),
        appBar: AppBar(
          elevation: 0,
          title: Center(child: Text("T O D O  A P P")),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskCompleted: todoList[index][1],
              taskName: todoList[index][0],
              onChanged: (value) => checkBoxChanged(value, index),
            );
          },
        ));
  }
}
