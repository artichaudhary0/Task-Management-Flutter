import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/utils/sort_dialogue.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80.0),
      child: Container(
        height: 80.0,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD4ECDD), Color(0xFFA6B1E1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Task Manager',
                style: TextStyle(
                  color: Color(0xFF2C3E50),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            IconButton(
              onPressed: showSortDialog,
              icon: const Icon(
                CupertinoIcons.decrease_indent,
                color: Color(0xFF34495E),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
