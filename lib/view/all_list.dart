import 'package:flutter/material.dart';

class AllList extends StatefulWidget {
  const AllList({super.key});

  @override
  State<AllList> createState() => _AllListState();
}

class _AllListState extends State<AllList> {
  List<Map<String, String>> todoItems = [
    {"title": 'Task 1', "description": 'Description 1'},
    {"title": 'Task 2', "description": 'Description 2'},
    {"title": 'Task 3', "description": 'Description 3'},
    {"title": 'Task 4', "description": 'Description 4'},
    {"title": 'Task 5', "description": 'Description 5'},
    {"title": 'Task 6', "description": 'Description 6'},
    {"title": 'Task 7', "description": 'Description 7'},
    {"title": 'Task 8', "description": 'Description 8'},
    {"title": 'Task 9', "description": 'Description 9'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          String title = todoItems[index]["title"] ?? '';
          String description = todoItems[index]["description"] ?? '';

          return Card(
            elevation: 3,
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(title),
              subtitle: Text(description),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
