import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white70,
          width: double.maxFinite,
          height: 1000,
          child: const Center(
            child: Text("Setting"),
          )),
    );
  }
}
