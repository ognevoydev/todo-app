import 'package:flutter/material.dart';
import '../model/todo.dart';

import '../constants/colors.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem(
      {Key? key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        tileColor: Colors.white,
        leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: blue),
        title: Text(
          todo.text!,
          style: TextStyle(
              fontSize: 16,
              color: black,
              decoration: todo.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            color: grey,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
