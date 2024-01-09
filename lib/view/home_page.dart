// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_demo/base/cutome_theme.dart';
import 'package:flutter_demo/view/chat_page.dart';
import 'package:flutter_demo/view/setting.dart';
import 'package:flutter_demo/view/theme_controler.dart';
import 'package:flutter_demo/view/profile.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.userName});

  final String userName;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userName = "Profile";
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final ThemeControler _themeControler = Get.put(ThemeControler());

  var data = [
    {"image": "assets/images/slider1.jpg"},
    {"image": "assets/images/slider.jpg"},
    {"image": "assets/images/slider1.jpg"},
  ];

  final List<Widget> _screens = [
    const Profile(),
    const Setting(),
    const ChatPage(),
  ];
  int currentIndex = 0;
  void onChangeValue(text) {
    setState(() {
      userName = text;
    });
  }

  void _onTabTapped(int index) {
    // print(index);
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
          backgroundColor: _themeControler.currentTheme.value == ThemeMode.light
              ? Colors.white
              : Colors.black,
          elevation: 10,
          selectedIconTheme: IconThemeData(
              // ignore: unrelated_type_equality_checks
              color: _themeControler.currentTheme == ThemeMode.light
                  ? const Color.fromRGBO(214, 185, 248, 1)
                  : const Color.fromRGBO(103, 80, 164, 1),
              size: 25),
          selectedItemColor:
              _themeControler.currentTheme.value == ThemeMode.light
                  ? const Color.fromRGBO(214, 185, 248, 1)
                  : const Color.fromRGBO(103, 80, 164, 1),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedIconTheme: IconThemeData(
            color: _themeControler.currentTheme.value == ThemeMode.light
                ? Colors.black
                : Colors.white,
          ),
          unselectedItemColor:
              _themeControler.currentTheme.value == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
          onTap: _onTabTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
          ]),
      drawer: Drawer(
        shape: const BeveledRectangleBorder(
            side: BorderSide(style: BorderStyle.none)),
        width: 250,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/background.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
                // color: Colors.greenAccent,
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage("assets/images/qaLogo.png"),
                    width: 50,
                  ),
                  Text(
                    'Raj Bhadaniya',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  Text(
                    'rajpatel@gmail.com',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            ListTile(
              selected: userName == "Profile",
              title: const Text('Profile'),
              onTap: () {
                onChangeValue("Profile");
                Navigator.pushNamed(context, "/profile");
              },
            ),
            ListTile(
              selected: userName == "Setting",
              title: const Text('Setting'),
              onTap: () {
                onChangeValue("Setting");
                Navigator.pushNamed(context, "/setting");
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Obx(
            () => Switch(
              value: _themeControler.currentTheme.value == ThemeMode.dark,
              onChanged: (value) {
                _themeControler.switchTheme();
                Get.changeThemeMode(_themeControler.currentTheme.value);
              },
              activeColor: CustomTheme.white,
            ),
          )
        ],
        title: Text(widget.userName),
        automaticallyImplyLeading: true,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),

      // body: SingleChildScrollView(
      //     child: Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: SizedBox(
      //         height: 180,
      //         child: CarouselSlider(
      //           options: CarouselOptions(
      //             height: 180,
      //             viewportFraction: 1,
      //             enableInfiniteScroll: true,
      //             reverse: false,
      //             autoPlay: true,
      //             autoPlayInterval: const Duration(seconds: 3),
      //             enlargeCenterPage: true,
      //             onPageChanged: (index, _) {
      //               setState(() {
      //                 currentIndex = index;
      //               });
      //             },
      //           ),
      //           items: data.map((i) {
      //             return Builder(
      //               builder: (BuildContext context) {
      //                 return SizedBox(
      //                   child: ClipRRect(
      //                     borderRadius: BorderRadius.circular(
      //                         15.0), // Apply the border radius to the image
      //                     child: Image.asset(
      //                       "assets/images/spashScreen.jpg",
      //                       height: 180,
      //                       width: 450,
      //                       fit: BoxFit.cover,
      //                     ),
      //                   ),
      //                 );
      //               },
      //             );
      //           }).toList(),
      //         ),
      //       ),
      //     ),
      //   ],
      // )
      // )
    );
  }
}
