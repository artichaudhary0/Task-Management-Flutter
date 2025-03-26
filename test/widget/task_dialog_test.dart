import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/task_controller.dart';
import 'package:todo_list/widgets/custom_task_dialogue.dart';

void main() {
  testWidgets("Should open task dialog and add a new task", (
    WidgetTester tester,
  ) async {
    Get.put(TaskController());

    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () => showTaskDialog(),
                child: Text("Open Dialog"),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text("Open Dialog"));
    await tester.pumpAndSettle();

    expect(find.text("Add Task"), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), "New Task");

    await tester.enterText(
      find.byType(TextField).at(1),
      "This is a description",
    );

    await tester.tap(find.text("Save"));
    await tester.pumpAndSettle();

    expect(Get.find<TaskController>().tasks.length, 1);
    expect(Get.find<TaskController>().tasks.first.title, "New Task");
  });
}
