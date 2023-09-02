import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SearchBar extends StatelessWidget {
  final runFilter;

  const SearchBar(
      {Key? key,
      required this.runFilter,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => runFilter(value),
        decoration: const InputDecoration(
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
}
