import 'package:flutter/material.dart';
import 'package:flutter_demo/base/common_button.dart';
import 'package:flutter_demo/view/theme_controler.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // ignore: prefer_final_fields
  ThemeControler _themeControler = Get.find<ThemeControler>();

  // @override
  // void initState() {
  //   // ignore: avoid_print
  //   print("==========Initialize state ==============");
  //   controller.changeUserName("Parth");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // var controller2 = controller;
    return Scaffold(
        body: Container(
            color: Theme.of(context).primaryColor,
            width: double.maxFinite,
            height: 1000,
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "USER NAME  ${_themeControler.getUserName}",
                    ),
                  ),
                  CommonButton(
                      buttonText: "Change Name",
                      onPressed: () => {_themeControler.changeUserName("Raj")}),
                ],
              );
            })));
  }
}
