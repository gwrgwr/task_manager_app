import 'package:task_manager_app/task/models/task_model.dart';

abstract class TaskEvent {}

class GetTasks extends TaskEvent {}

class PostTasks extends TaskEvent {
  final TaskModel task;

  PostTasks({required this.task});
}

class DeleteTask extends TaskEvent {
  final TaskModel task;

  DeleteTask({required this.task});
}
