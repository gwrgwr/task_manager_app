import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/utils/color_app.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Tasks',
          style: TextStyle(
            color: ColorApp.textColor,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorApp.backgroundColor,
      ),
    );
  }
}
