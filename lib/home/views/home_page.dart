import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/color_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.username, super.key});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundColor,
        title: Text(
          username,
          style: TextStyle(color: ColorApp.textColor),
        ),
        centerTitle: true,
      ),
    );
  }
}
