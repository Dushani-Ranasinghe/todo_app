import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
List todoList = [
  ["make tutorials",false],
   ["bake cake",false],
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
            decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Add a new task"),
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

class TodoTile extends StatelessWidget {
  late final String taskName;
  late final bool taskCompleted;
  // ( ↓ ) type of method that checklist required
  Function(bool?)? onChanged;

  //create constructors for above variables
  TodoTile(
      {super.key,
      required this.taskCompleted,
      required this.taskName,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Container(
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged,activeColor: Colors.black,),
            Text(taskName, style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),),
          ],
        ),
      ),
    );
  }
}

