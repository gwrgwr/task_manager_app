import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_app/task/cubit/task_cubit.dart';
import 'package:task_manager_app/task/models/task_model.dart';
import 'package:task_manager_app/utils/color_app.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({required this.username, super.key});

  final String username;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String getTimeNow() {
    final DateTime myDateTime = DateTime.now();
    final formatedDate = DateFormat.H().format(myDateTime);
    final int formatedDateInt = int.parse(formatedDate);
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
      appBar: appBarSection(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          children: [
            TextField(
              cursorColor: ColorApp.textColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorApp.inputColor,
                hintText: "Search your task...",
                hintStyle: TextStyle(
                  color: ColorApp.textColor.withOpacity(0.6),
                ),
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: ColorApp.textColor,
                  ),
                  onPressed: () {},
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: ColorApp.textColor),
                ),
              ),
            ),
            SizedBox(height: 15),
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                // c.selectedDay.value = selectedDate.day;
              },
              headerProps: EasyHeaderProps(
                dateFormatter: DateFormatter.fullDateDMonthAsStrY(),
                showMonthPicker: false,
                selectedDateStyle:
                    TextStyle(color: ColorApp.textColor, fontSize: 21),
              ),
              dayProps: EasyDayProps(
                height: 90,
                todayHighlightStyle: TodayHighlightStyle.withBackground,
                todayHighlightColor: ColorApp.subBackgroundColor,
                todayStyle: DayStyle(
                  dayStrStyle: TextStyle(
                    color: ColorApp.backgroundColor,
                    fontSize: 14,
                  ),
                  dayNumStyle: TextStyle(
                    color: ColorApp.backgroundColor,
                    fontSize: 26,
                  ),
                ),
                activeDayStyle: DayStyle(
                  decoration: BoxDecoration(
                    color: ColorApp.subBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                dayStructure: DayStructure.dayStrDayNum,
                inactiveDayStyle: DayStyle(
                  dayNumStyle:
                      TextStyle(color: ColorApp.textColor, fontSize: 20),
                ),
              ),
              timeLineProps: EasyTimeLineProps(
                separatorPadding: 9,
                vPadding: 4,
              ),
            ),
            SizedBox(height: 15),
            BlocBuilder<TaskCubit, List<TaskModel>>(
              bloc: TaskCubit(),
              builder: (context, state) {
                final task = BlocProvider.of<TaskCubit>(context).state;
                return task.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10),
                          itemCount: task.length,
                          itemBuilder: (context, index) {
                            final item = task[index];
                            return Slidable(
                              endActionPane: ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  Center(
                                    child: Icon(
                                      Icons.delete,
                                      color: ColorApp.textColor,
                                    ),
                                  ),
                                ],
                              ),
                              child: Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  color: task.length % 2 == 0
                                      ? ColorApp.subBackgroundColor
                                      : ColorApp.inputColor,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      item.taskName,
                                      style: TextStyle(
                                        color: ColorApp.textColor,
                                        fontSize: 22,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Text('No Tasks'),
                      );
              },
            )
          ],
        ),
      ),
    );
  }

  AppBar appBarSection() {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(color: ColorApp.inputColor),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: ColorApp.textColor,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_rounded,
                  color: ColorApp.backgroundColor,
                ),
              ),
            ),
          ),
        )
      ],
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
            widget.username,
            style: TextStyle(color: ColorApp.textColor, fontSize: 24),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
