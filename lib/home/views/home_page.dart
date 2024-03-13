import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:task_manager_app/home/controllers/home_controller.dart';
import 'package:task_manager_app/home/widgets/home_widget.dart';
import 'package:task_manager_app/task/widgets/task_widgett.dart';
import 'package:task_manager_app/timeline/widgets/timeline_widget.dart';
import 'package:task_manager_app/utils/color_app.dart';

class HomePage extends StatelessWidget {
  HomePage({required this.username, super.key});

  final String username;

  final HomeController c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = [
      HomeWidget(username: username),
      TaskWidget(),
      TimeLineWidget()
    ];

    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      body: Obx(() {
        return _widgetOptions.elementAt(c.index.value);
      }),
      bottomNavigationBar: bottomNavigationBarSection(),
    );
  }

  Stack bottomNavigationBarSection() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: GNav(
              activeColor: ColorApp.textColor,
              backgroundColor: ColorApp.inputColor,
              tabBackgroundColor: ColorApp.subBackgroundColor,
              gap: 10,
              padding: EdgeInsets.all(20),
              tabMargin: EdgeInsets.all(8),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.list,
                  text: 'Tasks',
                ),
                GButton(
                  icon: Icons.timeline,
                  text: 'Timeline',
                ),
              ],
              selectedIndex: c.index.value,
              onTabChange: (value) => c.index.value = value,
            ),
          ),
        ),
      ],
    );
  }
}
