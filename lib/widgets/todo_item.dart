import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: const Icon(Icons.check_box, color: blue),
        title: const Text(
          'Test ToDo',
          style: TextStyle(
              fontSize: 16,
              color: black,
              decoration: TextDecoration.lineThrough),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration:
              BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            color: grey,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
