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
  ["Make tutorials",false],
   ["Bake a cake",false],
];

void checkBoxChanged(bool? value, int index){
  setState(() {
    todoList[index][1] = !todoList[index][1];
  });
}
void createNewTask(){
  showDialog(context: context, builder: ((context) {
    return AlertDialog(
      // title: "Create a new task",
      content: Container(height: 120,
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Add a new task",),
          ),
           Row(

           )

        ],
      ),),
      backgroundColor: Colors.green,
      
    );
  }));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          elevation: 0,
          title: Center(child: Text("To Do")),
        ),
        floatingActionButton: FloatingActionButton(onPressed: createNewTask, child: Icon(Icons.add),),
        body: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return TodoTile(taskCompleted: todoList[index][1], taskName: todoList[index][0], onChanged: (value)=> checkBoxChanged(value, index), );
            },
        ));
  }
}



