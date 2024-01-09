// ignore: file_names
import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});
  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white70,
          width: 100,
          height: 1000,
          child: const Center(
            child: Text("ErrorPage"),
          )),
    );
  }
}
