import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:intl/intl.dart';
class TaskItem extends StatelessWidget {
  const TaskItem(this.task,
      {super.key}); // Remarquez que j'ai corrigé l'erreur de syntaxe ici.

  final Task task;


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.add_task_rounded),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.title,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text(task.description),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date: ${DateFormat('dd/MM/yyyy HH:mm').format(task.date)}',
                          textAlign: TextAlign.left),
                      SizedBox(height: 5),
                      Text('Category:${task.category.name}',
                          textAlign: TextAlign.left),
                    ],
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
