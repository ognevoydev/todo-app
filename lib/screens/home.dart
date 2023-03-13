import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: _buildAppBar(),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              searchBox(),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 20),
                    child: const Text(
                      'Все задачи',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const ToDoItem(),
                  const ToDoItem(),
                  const ToDoItem(),
                ],
              ))
            ],
          )),
    );
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: const TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: black,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'Поиск',
            hintStyle: TextStyle(color: grey)),
      ),
    );
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
