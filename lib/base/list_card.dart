import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/Controler/data_controller.dart';
import 'package:to_do_list/ModalClass/todolist_modal.dart';

class ListCard extends StatefulWidget {
  const ListCard({super.key, required this.item});
  final TodoListModal item;

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  final dataControler = Get.put(DataControler());

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    widget.item.description,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var index = dataControler.todoList.indexOf(widget.item);
                      dataControler.selectFavourite(
                          index, !widget.item.isFavourite);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 4,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                    ),
                    child: Icon(
                      widget.item.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Color.fromARGB(224, 110, 7, 245),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
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
                    child: const Icon(
                      Icons.delete,
                      color: Color.fromARGB(224, 110, 7, 245),
                    ),
                  ),
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
  }
}
