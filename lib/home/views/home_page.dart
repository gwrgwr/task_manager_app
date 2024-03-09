import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_app/utils/color_app.dart';

class HomePage extends StatelessWidget {
  HomePage({required this.username, super.key});

  final String username;

  String getTimeNow() {
    final DateTime myDateTime = DateTime.now();
    final formatedDate = DateFormat.H().format(myDateTime);
    final int formatedDateInt = int.parse(formatedDate);
    print(formatedDate);
    if (formatedDateInt >= 18 || formatedDateInt < 6) {
      return "Good Night 🛌";
    } else if (formatedDateInt >= 6 || formatedDateInt < 12) {
      return "Good Morning 🌞";
    } else {
      return "Good Evening 🍽";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundColor,
        toolbarHeight: 70,
        title: Column(
          children: [
            SizedBox(height: 15),
            Text(
              getTimeNow(),
              style: TextStyle(
                  color: ColorApp.textColor.withOpacity(0.4), fontSize: 18),
            ),
            Text(
              username,
              style: TextStyle(color: ColorApp.textColor, fontSize: 24),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(),
    );
  }
}
