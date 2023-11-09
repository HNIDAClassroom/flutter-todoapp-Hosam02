import 'package:flutter/material.dart';
import 'package:todolist_app/models/task.dart';
import 'package:todolist_app/services/firestore.dart';
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
  final FirestoreService firestoreService = FirestoreService();
  List<Task> _registeredTasks = [];

  void _openAddTaskOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTask(onAddTask: _addTask),
    );
  }


  void _addTask(Task task) {
    setState(() {
      _registeredTasks.add(task);
      firestoreService.addTask(task);
      Navigator.pop(context);
    });
  }

  Future<List<Task>> _fetchTasks() async {
    List<Task> tasks = (await firestoreService.getTasks()) as List<Task>;
    setState(() {
    _registeredTasks = tasks;
  });
    return tasks;}

  @override
  void initState() {
    super.initState();
    _fetchTasks();
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
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.add),
                  ))),
        
        ],
      ),
    body: TasksList(tasks: _registeredTasks ),
    );
  }
}
