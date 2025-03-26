import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/utils/custom_textfield.dart';
import '../controllers/task_controller.dart';
import '../utils/custom_theme.dart';
import '../utils/date_formatter.dart';
import '../utils/edit_add_task_dialogue.dart';
import '../utils/sort_dialogue.dart';

class TodoScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager', style: AppTextStyles.heading),
        backgroundColor: AppColors.accent,
        centerTitle: true,
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: AppColors.white),
            onPressed: showSortDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
              controller: taskController.searchController,
              label: "Search task",
              onChanged: taskController.searchTasks,
              suffixIcon:
                  taskController.searchController.text.isNotEmpty
                      ? IconButton(
                        icon: const Icon(Icons.clear, color: AppColors.black),
                        onPressed: () {
                          taskController.searchController.clear();
                          taskController.searchTasks('');
                        },
                      )
                      : null,
            ),
          ),

          Expanded(
            child: Obx(() {
              var tasks = taskController.tasks;
              return tasks.isEmpty
                  ? const Center(
                    child: Text("No tasks found!", style: AppTextStyles.normal),
                  )
                  : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      var task = tasks[index];
                      var descriptionPreview = _getFirstWords(
                        task.description,
                        10,
                      );

                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.primary),
                          gradient: LinearGradient(
                            colors: [AppColors.lightMint, AppColors.softBlue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 2,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Task Title & Priority Badge
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      task.title,
                                      style: AppTextStyles.heading.copyWith(
                                        fontSize: 18,
                                        color: AppColors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _getPriorityColor(task.priority),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      task.priority.toUpperCase(),
                                      style: AppTextStyles.normal.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 6),

                              Text(
                                descriptionPreview,
                                style: AppTextStyles.normal.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),

                              const SizedBox(height: 6),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Due: ${DateFormatter.formatDate(task.dueDate)}",
                                    style: AppTextStyles.normal.copyWith(
                                      color: AppColors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                        ),
                                        onPressed:
                                            () => showTaskDialog(index: index),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: AppColors.red,
                                        ),
                                        onPressed:
                                            () => taskController.deleteTask(
                                              index,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
            }),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accent,
        onPressed: () => showTaskDialog(),
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }

  String _getFirstWords(String text, int wordCount) {
    List<String> words = text.split(" ");
    return words.length > wordCount
        ? "${words.sublist(0, wordCount).join(" ")}..."
        : text;
  }

  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.blueGrey;
    }
  }
}
