import 'package:flutter/material.dart';

import 'drawer_menu_item.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: const Column(
        children: [
          DrawerMenuItem(id: 1, title: "Корзина", icon: Icons.delete),
          Divider(),
          DrawerMenuItem(
              id: 2, title: "Настройки", icon: Icons.settings),
          DrawerMenuItem(
              id: 3, title: "Уведомления", icon: Icons.notifications),
          Divider(),
          DrawerMenuItem(
              id: 4, title: "Обратная связь", icon: Icons.feedback),
        ],
      ),
    );
  }
}
