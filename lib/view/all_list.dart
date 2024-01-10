import 'package:flutter/material.dart';

class AllList extends StatefulWidget {
  const AllList({super.key});

  @override
  State<AllList> createState() => _AllListState();
}

class _AllListState extends State<AllList> {
  List<Map<String, dynamic>> todoItems = [
    {"title": 'Task 1', "description": 'Description 1', "isFavourite": true},
    {"title": 'Task 2', "description": 'Description 2', "isFavourite": false},
    {"title": 'Task 3', "description": 'Description 3', "isFavourite": true},
    {"title": 'Task 4', "description": 'Description 4', "isFavourite": false},
    {"title": 'Task 5', "description": 'Description 5', "isFavourite": true},
    {"title": 'Task 6', "description": 'Description 6', "isFavourite": false},
    {"title": 'Task 7', "description": 'Description 7', "isFavourite": true},
    {"title": 'Task 8', "description": 'Description 8', "isFavourite": false},
    {"title": 'Task 9', "description": 'Description 9', "isFavourite": true},
  ];

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: todoItems.length,
          itemBuilder: (context, index) {
            String title = todoItems[index]["title"] ?? '';
            String description = todoItems[index]["description"] ?? '';

            IconData iconData = todoItems[index]["isFavourite"]
                ? Icons.favorite
                : Icons.favorite_border;
            Color iconColor = todoItems[index]["isFavourite"]
                ? Colors.red
                : Colors.grey; // Example colors

            return Card(
                elevation: 3,
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(description),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 4,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                            ),
                            child: Icon(
                              iconData,
                              color: iconColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              AlertDialog(
                                  title: new Text("Alert Dialog title"));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 4,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Color.fromARGB(224, 110, 7, 245),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print('Button pressed!');
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 4,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Color.fromARGB(224, 110, 7, 245),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
