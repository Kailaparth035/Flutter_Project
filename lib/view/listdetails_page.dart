import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:to_do_list/Controler/data_controller.dart';

class ListDetailsPage extends StatefulWidget {
  const ListDetailsPage({super.key});

  @override
  State<ListDetailsPage> createState() => _ListDetailsPageState();
}

class _ListDetailsPageState extends State<ListDetailsPage> {
  // final String title = "";
  // final String description = "";
  dynamic argumentData = Get.arguments;
  final dataControler = Get.find<DataControler>();

  final _titleTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(argumentData);
    // _titleTextController.text = argumentData?.title;
    // _descriptionTextController.text = argumentData?.description;
  }

  void addOrUpdateData() async {
    try {
      dataControler.addTodoList();
      Get.back();
    } catch (error) {
      print("display toast message using flutter");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("List Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 25, top: 10),
                  child: TextFormField(
                    validator: (text) {
                      if (text?.split(' ').length != 3) {
                        return 'Reached max words';
                      }
                      return null;
                    },
                    controller: _titleTextController,
                    onChanged: (text) {
                      dataControler.title.value = text;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Title',
                      hintText: 'Enter Your Title',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: TextFormField(
                    controller: _descriptionTextController,
                    onChanged: (text) {
                      dataControler.description.value = text;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Description',
                      hintText: 'Enter Your Description',
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "Select is Favourite",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Obx(() {
                      return Switch(
                          value: dataControler.isFavourite.value,
                          onChanged: (value) => setState(() {
                                dataControler.isFavourite.value = value;
                              }));
                    })
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(134, 110, 0, 235)),
                  onPressed: () {
                    addOrUpdateData();
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
