import 'package:flutter/material.dart';

import '../constants/colors.dart';

class TrashScreen extends StatefulWidget {
  const TrashScreen({Key? key}) : super(key: key);

  @override
  State<TrashScreen> createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgcolor,
    );
  }
}
