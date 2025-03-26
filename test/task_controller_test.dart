import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/task_controller.dart';
import 'package:todo_list/models/task_model.dart';

void main() {
  late TaskController taskController;

  setUp(() {
    Get.testMode = true;
    taskController = TaskController();
  });

  test("Should add a task successfully", () {
    var task = TaskModel(
      title: "Test Task",
      description: "This is a test task",
      priority: "High",
      dueDate: DateTime.now(),
      creationDate: DateTime.now(),
    );

    taskController.addOrEditTask(task: task);
    expect(taskController.tasks.length, 1);
    expect(taskController.tasks.first.title, "Test Task");
  });

  test("Should edit an existing task", () {
    var task = TaskModel(
      title: "Old Task",
      description: "Old description",
      priority: "Medium",
      dueDate: DateTime.now(),
      creationDate: DateTime.now(),
    );

    taskController.addOrEditTask(task: task);

    var updatedTask = TaskModel(
      title: "Updated Task",
      description: "New description",
      priority: "High",
      dueDate: DateTime.now(),
      creationDate: task.creationDate,
    );

    taskController.addOrEditTask(index: 0, task: updatedTask);

    expect(taskController.tasks[0].title, "Updated Task");
    expect(taskController.tasks[0].description, "New description");
  });

  test("Should delete a task", () {
    var task = TaskModel(
      title: "To be deleted",
      description: "Will be removed",
      priority: "Low",
      dueDate: DateTime.now(),
      creationDate: DateTime.now(),
    );

    taskController.addOrEditTask(task: task);
    expect(taskController.tasks.length, 1);

    taskController.deleteTask(0);
    expect(taskController.tasks.length, 0);
  });

  test("Should sort tasks by priority (High to Low)", () {
    var task1 = TaskModel(
      title: "Task 1",
      description: "Low Priority Task",
      priority: "Low",
      dueDate: DateTime.now(),
      creationDate: DateTime.now(),
    );
    var task2 = TaskModel(
      title: "Task 2",
      description: "High Priority Task",
      priority: "High",
      dueDate: DateTime.now(),
      creationDate: DateTime.now(),
    );

    taskController.addOrEditTask(task: task1);
    taskController.addOrEditTask(task: task2);

    taskController.sortTasksByPriority(descending: true);

    expect(taskController.tasks.first.priority, "High");
  });

  test("Should restore the original order of tasks", () {
    var task1 = TaskModel(
      title: "First Task",
      description: "Task 1",
      priority: "Medium",
      dueDate: DateTime.now(),
      creationDate: DateTime.now(),
    );
    var task2 = TaskModel(
      title: "Second Task",
      description: "Task 2",
      priority: "High",
      dueDate: DateTime.now(),
      creationDate: DateTime.now(),
    );

    taskController.addOrEditTask(task: task1);
    taskController.addOrEditTask(task: task2);

    taskController.sortTasksByPriority(descending: true);
    taskController.restoreOriginalOrder();

    expect(taskController.tasks.first.title, "First Task");
  });
}
