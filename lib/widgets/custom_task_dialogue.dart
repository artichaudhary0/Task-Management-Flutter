import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../models/task_model.dart';
import '../services/notification_service.dart';
import 'custom_textfield.dart';
import 'custom_date_picker.dart';

class TaskDialog extends StatefulWidget {
  final int? index;

  const TaskDialog({super.key, this.index});

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final TaskController taskController = Get.find<TaskController>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late String selectedPriority;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      var task = taskController.tasks[widget.index!];
      titleController = TextEditingController(text: task.title);
      descriptionController = TextEditingController(text: task.description);
      selectedPriority = task.priority;
      selectedDate = task.dueDate;
    } else {
      titleController = TextEditingController();
      descriptionController = TextEditingController();
      selectedPriority = 'Low';
      selectedDate = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.index == null ? "Add Task" : "Edit Task",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF344955),
              ),
            ),
            const SizedBox(height: 10),

            // Title Input Field
            CustomTextField(controller: titleController, label: "Title"),
            const SizedBox(height: 10),

            // Description Input Field
            CustomTextField(
              controller: descriptionController,
              label: "Description",
              maxLines: 2,
            ),
            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              value: selectedPriority,
              decoration: InputDecoration(
                labelText: "Priority",
                labelStyle: const TextStyle(color: Color(0xFF344955)),
                filled: true,
                fillColor: const Color(0xFFE8F0F2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFF344955),
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFF344955),
                    width: 1.5,
                  ),
                ),
              ),
              dropdownColor: Colors.white,
              icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF344955)),
              items:
                  ['Low', 'Medium', 'High']
                      .map(
                        (priority) => DropdownMenuItem(
                          value: priority,
                          child: Text(priority),
                        ),
                      )
                      .toList(),
              onChanged: (value) => setState(() => selectedPriority = value!),
            ),
            const SizedBox(height: 10),

            CustomDatePicker(
              selectedDate: selectedDate,
              onDateSelected: (newDate) {
                setState(() => selectedDate = newDate);
              },
            ),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF344955),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (titleController.text.isNotEmpty) {
                      var newTask = TaskModel(
                        title: titleController.text,
                        description: descriptionController.text,
                        priority: selectedPriority,
                        dueDate: selectedDate,
                        creationDate:
                            widget.index == null
                                ? DateTime.now()
                                : taskController
                                    .tasks[widget.index!]
                                    .creationDate,
                      );

                      taskController.addOrEditTask(
                        index: widget.index,
                        task: newTask,
                      );
                      NotificationService().scheduleTaskNotification(newTask);
                      Get.back();
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showTaskDialog({int? index}) {
  Get.dialog(TaskDialog(index: index));
}
