import 'package:flutter/material.dart';
import '../constants/colors.dart';

class DrawerMenuItem extends StatefulWidget {
  final int id;
  final String title;
  final IconData icon;

  const DrawerMenuItem(
      {Key? key, required this.id, required this.title, required this.icon})
      : super(key: key);

  @override
  State<DrawerMenuItem> createState() => _DrawerMenuItemState();
}

class _DrawerMenuItemState extends State<DrawerMenuItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        tileColor: Colors.transparent,
        leading: Icon(
          widget.icon,
          size: 20,
          color: grey,
        ),
        minLeadingWidth: 32,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        onTap: () {
          _onItemClick(widget.id);
        });
  }

  void _onItemClick(int id) {
    Navigator.pop(context);
    setState(() {
      switch (id) {
        case 1:
          Navigator.pushNamed(context, '/trash');
          break;
        case 2:
          Navigator.pushNamed(context, '/settings');
          break;
        case 3:
          Navigator.pushNamed(context, '/settings');
          break;
        case 4:
          Navigator.pushNamed(context, '/notifications');
          break;
        case 5:
          Navigator.pushNamed(context, '/feedback');
          break;
      }
    });
  }
}
