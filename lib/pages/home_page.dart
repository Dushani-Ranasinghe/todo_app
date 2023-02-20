import 'package:flutter/material.dart';
import '../util/new_task_dialog.dart';
import '../util/todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //todo tasks list
  List todoList = [
    ["Make tutorials", false],
    ["Bake a cake", false],
  ];
//text controller
final _controller = TextEditingController();

//check box was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }
//save 
void saveTask(){
  
  setState(() {
    //add task to list, 
    todoList.add([_controller.text, false]);
    //clear textbox
    _controller.clear();
    
  } );
   //close popup after saving task
  Navigator.of(context).pop();
}
//delete task
void _deleteTask(int index){
  setState(() {
    todoList.removeAt(index);
  });
}
  void createNewTask() {
    showDialog(
        context: context,
        builder: ((context) {
          return DialogBox(
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSave: saveTask,
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
              deleteTask: (context) => _deleteTask(index),
            );
          },
        ));
  }
}
