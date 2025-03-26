import 'dart:convert';

class TaskModel {
  String title;
  String description;
  String priority;
  DateTime dueDate;
  DateTime creationDate;
  bool isCompleted;

  TaskModel({
    required this.title,
    required this.description,
    required this.priority,
    required this.dueDate,
    required this.creationDate,
    this.isCompleted = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    title: json['title'],
    description: json['description'],
    priority: json['priority'],
    dueDate: DateTime.parse(json['dueDate']),
    creationDate: DateTime.parse(json['creationDate']),
    isCompleted: json['isCompleted'] ?? false,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'priority': priority,
    'dueDate': dueDate.toIso8601String(),
    'creationDate': creationDate.toIso8601String(),
    'isCompleted': isCompleted,
  };

  static List<TaskModel> fromJsonList(String jsonData) {
    Iterable list = json.decode(jsonData);
    return list.map((task) => TaskModel.fromJson(task)).toList();
  }

  static String toJsonList(List<TaskModel> tasks) {
    return json.encode(tasks.map((task) => task.toJson()).toList());
  }
}
