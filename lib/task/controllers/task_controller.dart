import 'package:get/get.dart';
import 'package:task_manager_app/task/models/task_model.dart';

class TaskController extends GetxController {
  
  RxMap<String, List<String>> mapTask = <String, List<String>>{}.obs;
  
  void addItem(TaskModel taskModel) {
    mapTask[taskModel.type] = [];
    mapTask[taskModel.type]!.add(taskModel.taskName);
  }
}