import 'package:flutter/material.dart';
import 'package:todo_app/widgets/search_bar.dart';

import '../constants/colors.dart';
import '../model/todo.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _allTodoList = ToDo.todoList();
  List<ToDo> _foundTodoList = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundTodoList = _allTodoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgcolor,
        appBar: _buildAppBar(),
        body: Column(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: bgcolor,
                child: SearchBar(runFilter: _runFilter)),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Expanded(
                            child: ListView(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 50, bottom: 20),
                              child: const Text(
                                'Все задачи',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w500),
                              ),
                            ),
                            for (ToDo todo in _foundTodoList.reversed)
                              ToDoItem(
                                todo: todo,
                                onToDoChanged: _todoChange,
                                onDeleteItem: _todoDelete,
                              )
                          ],
                        ))
                      ],
                    ))),
            Row(
              children: [
                Expanded(
                    child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  margin:
                      const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 3.0,
                            spreadRadius: 0),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _todoController,
                    decoration: const InputDecoration(
                      hintText: 'Добавить задачу',
                      border: InputBorder.none,
                    ),
                  ),
                )),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _todoAdd(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: blue,
                        minimumSize: const Size(50, 50),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 38,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  void _todoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _todoDelete(int id) {
    setState(() {
      _allTodoList.removeWhere((element) => element.id == id);
      _foundTodoList.removeWhere((element) => element.id == id);
    });
  }

  void _todoAdd(String todo) {
    setState(() {
      _allTodoList.add(
          ToDo(id: DateTime.now().millisecondsSinceEpoch.toInt(), text: todo));
    });
    _todoController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _runFilter(String searchString) {
    List<ToDo> results = [];
    if (searchString.isEmpty) {
      results = _allTodoList;
    } else {
      results = _allTodoList
          .where((element) =>
              element.text!.toLowerCase().contains(searchString.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundTodoList = results;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: bgcolor,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: black,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/avatar.jpg',
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }
}
