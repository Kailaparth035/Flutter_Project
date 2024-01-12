import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/Controler/data_controller.dart';
import 'package:to_do_list/base/list_card.dart';

class Favouite extends StatefulWidget {
  const Favouite({super.key});

  @override
  State<Favouite> createState() => _FavouiteState();
}

class _FavouiteState extends State<Favouite> {
  final dataControler = Get.put(DataControler());
  final List<Map<String, String>> dataArray = [
    {"title": "Title1", "description": "description1"},
    {"title": "Title2", "description": "description2"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return Column(
              children: dataControler.todoList
                  .where((listItem) => listItem.isFavourite == true)
                  .map(
                    (item) => ListCard(
                      item: item,
                    ),
                  )
                  .toList(),
            );
          }),
        ),
      ),
    ));
  }
}
