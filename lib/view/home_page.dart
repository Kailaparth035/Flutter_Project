import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:to_do_list/Controler/data_controller.dart';
import 'package:to_do_list/view/all_list.dart';
import 'package:to_do_list/view/dashboard_page.dart';
import 'package:to_do_list/view/favourite.dart';
import 'package:to_do_list/view/listdetails_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final dataControler = Get.put(DataControler());

  final List<Widget> _screens = [
    const Dashboard(),
    const AllList(),
    const Favouite(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedIconTheme: const IconThemeData(
              color: Color.fromRGBO(103, 80, 164, 1), size: 25),
          selectedItemColor: const Color.fromRGBO(103, 80, 164, 1),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'ToDoList',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourite',
            ),
          ]),
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("TO DO LIST"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: IconButton(
                icon: const Icon(
                  Icons.add_box,
                  color: Color.fromARGB(224, 110, 7, 245),
                  size: 30,
                ),
                tooltip: "Save Todo and Retrun to List",
                onPressed: () {
                  dataControler.type.value = "add";
                  var item = {
                    "title": "",
                    "description": "",
                    "isFavourite": false,
                  };
                  Get.to(const ListDetailsPage(), arguments: item);
                },
              ),
            )
          ]),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),
    );
  }
}
