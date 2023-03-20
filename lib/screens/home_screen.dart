import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../model/todo.dart';
import '../widgets/search_bar.dart';
import '../widgets/todo_item.dart';
import '../widgets/drawer_header.dart';
import '../widgets/drawer_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            child: Container(
              child: const Column(
                children: [
                  MDrawerHeader(),
                  DrawerList(),
                ],
              ),
            ),
          ),
        ),
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
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: black,
              size: 30,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
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
