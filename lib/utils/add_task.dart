import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Addtask extends StatelessWidget {
  TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  Addtask(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Add Task',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onSave,
                  child: Text('Save'),
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.yellow)),
                ),
                SizedBox(
                  width: 8,
                ),
                TextButton(
                  onPressed: onCancel,
                  child: Text('Cancel'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.yellow)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
