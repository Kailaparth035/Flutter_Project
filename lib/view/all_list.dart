import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:to_do_list/Controler/data_controller.dart';
import 'package:to_do_list/base/list_card.dart';
import 'package:to_do_list/view/listdetails_page.dart';

class AllList extends StatefulWidget {
  const AllList({super.key});

  @override
  State<AllList> createState() => _AllListState();
}

class _AllListState extends State<AllList> {
  final dataControler = Get.put(DataControler());

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return ListView.builder(
            itemCount: dataControler.todoList.length,
            itemBuilder: (context, index) {
              // var tempList = dataControler.todoList;
              // String title = tempList[index].title;
              // String description = tempList[index].description;

              // IconData iconData = tempList[index].isFavourite
              //     ? Icons.favorite
              //     : Icons.favorite_border;
              // Color iconColor =
              //     tempList[index].isFavourite ? Colors.red : Colors.grey;

              return ListCard(item: dataControler.todoList[index]);
            },
          );
        }),
      ),
    );
  }

  showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      const SnackBar(
        backgroundColor: Color.fromARGB(255, 142, 17, 17),
        content: Text('Added to favorite'),
        // action: SnackBarAction(
        //     backgroundColor: const Color.fromARGB(255, 142, 17, 17),
        //     textColor: Colors.white,
        //     label: 'UNDO',
        //     onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  showAlertDialog(BuildContext context, index) async {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context, true);
      },
    );
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context, false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("My title"),
      content: const Text("This is my message."),
      actions: [okButton, cancelButton],
    );

    // show the dialog
    var result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

    if (result != null) {
      if (result == true) {
        dataControler.removeList(index);
      } else {
        print("Cancel Button Press from alert dialog ");
      }
    }
  }
}
