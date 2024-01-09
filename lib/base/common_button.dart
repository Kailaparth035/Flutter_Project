import 'package:flutter/material.dart';
import 'package:flutter_demo/view/theme_controler.dart';
import 'package:get/get.dart';

class CommonButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CommonButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeControler themeControler = Get.find<ThemeControler>();
    return Obx(() {
      return ElevatedButton(
        onPressed: onPressed,
        // ignore: sort_child_properties_last
        child: Text(
          buttonText,
          style: TextStyle(
              color: themeControler.currentTheme.value == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor:
                themeControler.currentTheme.value == ThemeMode.light
                    ? Colors.red
                    : Colors.yellow,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle: TextStyle(
                color: themeControler.currentTheme.value == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18)),
      );
    });
  }
}
