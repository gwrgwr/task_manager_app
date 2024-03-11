import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/color_app.dart';

class TimeLineWidget extends StatelessWidget {
  const TimeLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundColor,
        title: Text(
          'Time Line',
          style: TextStyle(
            color: ColorApp.textColor,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
