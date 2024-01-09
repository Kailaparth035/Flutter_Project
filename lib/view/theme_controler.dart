import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeControler extends GetxController {
  Rx<ThemeMode> currentTheme = ThemeMode.system.obs;

  RxString getUserName = "Patel".obs;
  // function to switch between themes
  void switchTheme() {
    currentTheme.value = currentTheme.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  void changeUserName(String name) {
    getUserName.value = name;
  }
}
