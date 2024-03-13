class TaskModel {
  final String taskName;
  final String description;
  final String dueDate;
  final String endDate;
  final String timeline;

  TaskModel(
      {required this.taskName,
      required this.description,
      required this.dueDate,
      required this.endDate,
      required this.timeline});
}
