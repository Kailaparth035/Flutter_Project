import 'package:get/get.dart';
import 'package:to_do_list/ModalClass/todolist_modal.dart';

class DataControler extends GetxController {
  RxString title = "".obs;
  RxString description = "".obs;
  RxBool isFavourite = false.obs;
  RxString type = "add".obs;
  RxInt index = 0.obs;

  RxList<TodoListModal> todoList = [
    TodoListModal(
        id: 1,
        title: "Title1",
        description: "Description 2",
        isFavourite: true),
  ].obs;

  void addTodoList() {
    if (type.value == "add") {
      todoList.add(TodoListModal(
          id: todoList.length + 1,
          title: title.value,
          description: description.value,
          isFavourite: isFavourite.value));
    } else {
      var item = TodoListModal(
          id: todoList[index.value].id,
          title: title.value,
          description: description.value,
          isFavourite: isFavourite.value);
      todoList[index.value] = item;
    }
    title = "".obs;
    description = "".obs;
    isFavourite = false.obs;
  }

  void removeList(int index) {
    print(index);
    print(todoList);
    todoList.removeAt(index);
  }

  void selectFavourite(index, value) {
    todoList[index].isFavourite = value;
    todoList.refresh();
  }
}
