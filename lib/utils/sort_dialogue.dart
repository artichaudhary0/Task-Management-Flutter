import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import 'custom_theme.dart';

class SortDialog extends StatelessWidget {
  final TaskController taskController = Get.find<TaskController>();

  SortDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Sort Tasks",
              style: AppTextStyles.heading.copyWith(color: AppColors.black),
            ),
            const SizedBox(height: 10),

            _buildSortOption(
              title: "High to Low Priority",
              icon: Icons.trending_down,
              onTap: () {
                taskController.sortTasksByPriority(descending: true);
                Get.back();
              },
            ),
            _buildSortOption(
              title: "Low to High Priority",
              icon: Icons.trending_up,
              onTap: () {
                taskController.sortTasksByPriority(descending: false);
                Get.back();
              },
            ),
            _buildSortOption(
              title: "Sort by Due Date",
              icon: Icons.calendar_today,
              onTap: () {
                taskController.sortTasksByDueDate();
                Get.back();
              },
            ),
            _buildSortOption(
              title: "Sort by Creation Date",
              icon: Icons.date_range,
              onTap: () {
                taskController.sortTasksByCreationDate();
                Get.back();
              },
            ),
            _buildSortOption(
              title: "Original Order",
              icon: Icons.restore,
              onTap: () {
                taskController.restoreOriginalOrder();
                Get.back();
              },
            ),

            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Get.back(),
              style: AppButtonStyles.textButton,
              child: const Text("Close", style: AppTextStyles.buttonText),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSortOption({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, style: AppTextStyles.normal),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        tileColor: AppColors.background,
        onTap: onTap,
      ),
    );
  }
}

void showSortDialog() {
  Get.dialog(SortDialog(), barrierDismissible: false);
}
