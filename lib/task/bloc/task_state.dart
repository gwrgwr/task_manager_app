import 'package:task_manager_app/task/models/task_model.dart';

abstract class TaskState {
  final List<TaskModel> taskList;

  TaskState({required this.taskList});
}

class TaskInitialState extends TaskState {
  TaskInitialState() : super(taskList: []);
}

class TaskLoadedlState extends TaskState {
  TaskLoadedlState({required List<TaskModel> taskList})
      : super(taskList: taskList);
}

class TaskErrorState extends TaskState {
  final Exception exception;
  TaskErrorState({required this.exception}) : super(taskList: []);
}
