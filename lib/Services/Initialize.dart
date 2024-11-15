import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';

class InitializationWidget extends StatefulWidget {
  final Widget child; // Add a child widget

  const InitializationWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<InitializationWidget> createState() => _InitializationWidgetState();
}

class _InitializationWidgetState extends State<InitializationWidget> {
  @override
  void initState() {
    super.initState();
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    dbHelper.insertExercisesFromJson('assets/exercises.json');
  }

  @override
  Widget build(BuildContext context) {
    return widget.child; // Return the child widget
  }
}
