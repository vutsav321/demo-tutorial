import 'package:demo/utils/add_task.dart';
import 'package:demo/utils/todo_widget.dart';
import 'package:flutter/material.dart';

List todolist = [
  ["Make app", false],
  ["Buy tea", false]
];
// method for onchanged Checkbox

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void deleteFunction(int index) {
      setState(() {
        todolist.removeAt(index);
      });
    }

    void onSave() {
      setState(() {
        todolist.add([controller.text, false]);
        controller.clear();
      });
      Navigator.of(context).pop();
    }

    void createNewTask() {
      showDialog(
          context: context,
          builder: (context) {
            return Addtask(
              controller: controller,
              onCancel: Navigator.of(context).pop,
              onSave: onSave,
            );
          });
    }

    void onChangeCheckBox(bool? value, int index) {
      setState(() {
        todolist[index][1] = !todolist[index][1];
      });
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        backgroundColor: Colors.amber.shade100,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Todo List'),
          elevation: 0,
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListView.builder(
                itemCount: todolist.length,
                itemBuilder: (context, index) {
                  return TodoWidget(
                      deleteFunction: (context) => deleteFunction(index),
                      title: todolist[index][0],
                      onChanged: (value) => onChangeCheckBox(value, index),
                      value: todolist[index][1]);
                }),
          ),
        ));
  }
}
