import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task_model.dart';
import '../services/notification_service.dart';

class TaskController extends GetxController {
  var tasks = <TaskModel>[].obs;
  var originalOrder = <TaskModel>[].obs;
  var searchQuery = ''.obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  Future<void> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tasksData = prefs.getString('tasks');
    if (tasksData != null) {
      tasks.value = TaskModel.fromJsonList(tasksData);
      originalOrder.value = List.from(tasks);
    }
  }

  Future<void> saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('tasks', TaskModel.toJsonList(tasks));
  }

  void addOrEditTask({int? index, required TaskModel task}) {
    if (index == null) {
      tasks.add(task);
      originalOrder.add(task);
    } else {
      tasks[index] = task;
      originalOrder[index] = task;
    }
    saveTasks();

    // Set reminder for the task
    NotificationService().scheduleTaskNotification(task);
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    originalOrder.removeAt(index);
    saveTasks();
  }

  void sortTasksByPriority({required bool descending}) {
    tasks.sort(
      (a, b) =>
          descending
              ? ['Low', 'Medium', 'High']
                  .indexOf(b.priority)
                  .compareTo(['Low', 'Medium', 'High'].indexOf(a.priority))
              : ['Low', 'Medium', 'High']
                  .indexOf(a.priority)
                  .compareTo(['Low', 'Medium', 'High'].indexOf(b.priority)),
    );
  }

  void sortTasksByDueDate() {
    tasks.sort((a, b) => a.dueDate.compareTo(b.dueDate));
  }

  void sortTasksByCreationDate() {
    tasks.sort((a, b) => a.creationDate.compareTo(b.creationDate));
  }

  void restoreOriginalOrder() {
    tasks.assignAll(originalOrder);
  }

  void searchTasks(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      tasks.assignAll(originalOrder);
    } else {
      tasks.assignAll(
        originalOrder.where(
          (task) => task.title.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }
}
