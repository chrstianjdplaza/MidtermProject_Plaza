import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import 'completed_tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tasks = [];

  void addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text('To-Do List'),
  backgroundColor: Colors.teal,
  actions: [
    IconButton(
      icon: const Icon(Icons.checklist),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CompletedTasksScreen()),
        );
      },
    ),
  ],
),

      body: ListView.builder(
  itemCount: tasks.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(tasks[index]),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          setState(() {
            tasks.removeAt(index);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Task deleted!"),
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  },
),



      floatingActionButton: FloatingActionButton(
  onPressed: () async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTaskScreen()),
    );
    if (result != null) {
  addTask(result);
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Task added!"),
      duration: Duration(seconds: 2),
    ),

  );
}
  },
  backgroundColor: Colors.teal,
  elevation: 6,
  child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
