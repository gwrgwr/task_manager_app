import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:task_manager_app/task/cubit/task_cubit.dart';
import 'package:task_manager_app/utils/color_app.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var maskFormatterDate = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    var maskFormatterTime = MaskTextInputFormatter(
        mask: '##:## - ##:##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);

    final TextEditingController taskTitleController = TextEditingController();
    final TextEditingController taskDescriptionController =
        TextEditingController();
    final TextEditingController taskDueDateController = TextEditingController();
    final TextEditingController taskEndDateController = TextEditingController();
    final TextEditingController taskTimelineController =
        TextEditingController();

    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      appBar: AppBar(
        title: Text(
          'New Task',
          style: TextStyle(
            color: ColorApp.textColor,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorApp.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              TextField(
                style: TextStyle(color: ColorApp.textColor),
                controller: taskTitleController,
                cursorColor: ColorApp.textColor,
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(color: ColorApp.textColor),
                  label: Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorApp.textColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorApp.subBackgroundColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                style: TextStyle(color: ColorApp.textColor),
                controller: taskDescriptionController,
                cursorColor: ColorApp.textColor,
                maxLines: 4,
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(color: ColorApp.textColor),
                  label: Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorApp.textColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorApp.subBackgroundColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 170,
                    child: TextField(
                      controller: taskDueDateController,
                      inputFormatters: [maskFormatterDate],
                      style: TextStyle(color: ColorApp.textColor),
                      cursorColor: ColorApp.textColor,
                      decoration: InputDecoration(
                        floatingLabelStyle:
                            TextStyle(color: ColorApp.textColor),
                        label: Text(
                          'Due Date',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: ColorApp.textColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: ColorApp.subBackgroundColor,
                          ),
                        ),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: TextField(
                      controller: taskEndDateController,
                      inputFormatters: [maskFormatterDate],
                      style: TextStyle(color: ColorApp.textColor),
                      cursorColor: ColorApp.textColor,
                      decoration: InputDecoration(
                        floatingLabelStyle:
                            TextStyle(color: ColorApp.textColor),
                        label: Text(
                          'End Date',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: ColorApp.textColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: ColorApp.subBackgroundColor,
                          ),
                        ),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                style: TextStyle(color: ColorApp.textColor),
                controller: taskTimelineController,
                inputFormatters: [maskFormatterTime],
                cursorColor: ColorApp.textColor,
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(color: ColorApp.textColor),
                  label: Text(
                    'Daily Timeline',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorApp.textColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorApp.subBackgroundColor,
                    ),
                  ),
                  suffixIcon: Icon(Icons.timer),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<TaskCubit>(context).AddItem(
                    taskTitleController.text,
                    taskDescriptionController.text,
                    taskDueDateController.text,
                    taskEndDateController.text,
                    taskTimelineController.text,
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: ColorApp.subBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: ColorApp.inputColor,
                    ),
                  ),
                  child: Text(
                    'Save',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorApp.textColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
