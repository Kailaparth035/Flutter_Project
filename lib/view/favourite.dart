import 'package:flutter/material.dart';

class Favouite extends StatefulWidget {
  const Favouite({super.key});

  @override
  State<Favouite> createState() => _FavouiteState();
}

class _FavouiteState extends State<Favouite> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Favourite"),
    );
  }
}
