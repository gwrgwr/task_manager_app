import 'package:task_manager_app/task/models/task_model.dart';

class TaskRepository {
  final List<TaskModel> _taskList = [];

  List<TaskModel> getTasks() {
    _taskList.addAll([]);
    return _taskList;
  }

  List<TaskModel> postTask({required TaskModel task}) {
    _taskList.add(task);
    return _taskList;
  }

  List<TaskModel> deleteTask({required TaskModel task}) {
    _taskList.remove(task);
    return _taskList;
  }
}
