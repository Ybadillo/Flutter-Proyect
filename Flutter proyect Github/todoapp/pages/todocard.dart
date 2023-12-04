import 'package:flutter/material.dart';

import 'package:todoapp/models/task.dart';

class TodoCard  extends StatefulWidget {
  final Task todo;

  const TodoCard({super.key, required this.todo});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool _isTodoChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(widget.todo.title),
              subtitle: Text(widget.todo.description),
              trailing: widget.todo.done
                  ? Icon(Icons.check_box, color: Colors.green)
                  : Icon(Icons.check_box_outline_blank, color: Colors.red),
            ),
          ),
          Center(
            child: Checkbox(
              value: _isTodoChecked,
              onChanged: (value) {
                setState(
                  () {
                  _isTodoChecked = value!;
                  },
                );
              },
            )
          )
        ],
       ),
    );
  }
}