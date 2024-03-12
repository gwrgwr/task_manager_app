import 'package:task_manager_app/task/bloc/task_event.dart';
import 'package:task_manager_app/task/bloc/task_state.dart';
import 'package:task_manager_app/task/models/task_model.dart';
import 'package:task_manager_app/task/repository/task_repository.dart';
import 'package:bloc/bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final _repository = TaskRepository();

  TaskBloc() : super(TaskInitialState()) {
    on<GetTasks>(
      (event, emit) => emit(
        TaskLoadedlState(
          taskList: _repository.getTasks(),
        ),
      ),
    );

    on<PostTasks>(
      (event, emit) => emit(
        TaskLoadedlState(
          taskList: _repository.postTask(task: event.task),
        ),
      ),
    );

    on<DeleteTask>(
      (event, emit) => emit(
        TaskLoadedlState(
          taskList: _repository.deleteTask(task: event.task),
        ),
      ),
    );
  }
}
