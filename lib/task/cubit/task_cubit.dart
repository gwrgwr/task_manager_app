import 'package:bloc/bloc.dart';
import 'package:task_manager_app/task/models/task_model.dart';

class TaskCubit extends Cubit<List<TaskModel>> {
  TaskCubit() : super([]);

  void AddItem(
    String title,
    String description,
    String dueDate,
    String endDate,
    String timeline,
  ) {
    final task = TaskModel(
      taskName: title,
      description: description,
      dueDate: dueDate,
      endDate: endDate,
      timeline: timeline,
    );

    emit([...state, task]);
  }
}
