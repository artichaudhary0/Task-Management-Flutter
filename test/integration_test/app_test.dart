import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_list/views/todo_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Full app flow: Add, Edit, and Delete a Task", (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(GetMaterialApp(home: TodoScreen()));

    expect(find.text("Task Manager"), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byType(TextField).at(0),
      "Integration Test Task",
    );
    await tester.enterText(
      find.byType(TextField).at(1),
      "Testing full app flow",
    );

    await tester.tap(find.text("Save"));
    await tester.pumpAndSettle();

    expect(find.text("Integration Test Task"), findsOneWidget);

    await tester.tap(find.byIcon(Icons.edit));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), "Updated Task");
    await tester.tap(find.text("Save"));
    await tester.pumpAndSettle();

    expect(find.text("Updated Task"), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    expect(find.text("Updated Task"), findsNothing);
  });
}
