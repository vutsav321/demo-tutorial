import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodoWidget extends StatelessWidget {
  bool value;
  Function(bool?) onChanged;
  Function(BuildContext)? deleteFunction;
  String title;

  TodoWidget(
      {super.key,
      required this.title,
      required this.onChanged,
      required this.value,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          borderRadius: BorderRadius.circular(20),
          onPressed: deleteFunction,
          icon: Icons.delete,
          backgroundColor: Colors.red,
        )
      ]),
      child: Container(
        padding: EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              title,
              style: TextStyle(
                  decoration:
                      value ? TextDecoration.lineThrough : TextDecoration.none),
            )
          ],
        ),
      ),
    );
  }
}
