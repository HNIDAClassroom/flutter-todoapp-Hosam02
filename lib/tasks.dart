import 'package:flutter/material.dart';
import 'package:todolist_app/models/task.dart';
import 'package:todolist_app/widgets/new_task.dart';

import 'tasks_list.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() {
    return _TasksState();
  }
}

class _TasksState extends State<Tasks> {
  final List<Task> _registeredTasks = [
    Task(
      title: 'Apprendre Flutter',
      description: 'Suivre le cours pour apprendre de nouvelles compétences',
      date: DateTime.now(),
      category: Category.work,
    ),
    Task(
      title: 'Faire les courses',
      description: 'Acheter des provisions pour la semaine',
      date: DateTime.now().subtract(Duration(days: 1)),
      category: Category.shopping,
    ),
    Task(
      title: 'Rediger un CR',
      description: '',
      date: DateTime.now().subtract(Duration(days: 2)),
      category: Category.personal,
    ),
    // Add more tasks with descriptions as needed
  ];
  void _openAddTaskOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTask(onAddTask: _addTask),
    );
  }

  Future<void> _addTask(Task task) async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _registeredTasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ToDoList'),
        actions: [
          IconButton(
              onPressed: _openAddTaskOverlay,
              icon: Ink(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.add),
                  ))),
        ],
      ),
      body: TasksList(tasks: _registeredTasks),
    );
  }
}
