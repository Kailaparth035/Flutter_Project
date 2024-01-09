import 'package:flutter/material.dart';
import 'package:flutter_demo/base/cutome_theme.dart';
// import 'package:flutter_demo/view/Setting.dart';
// import 'package:flutter_demo/view/home_page.dart';
// import 'package:flutter_demo/view/login_page.dart';
// import 'package:flutter_demo/view/profile.dart';

import 'package:flutter_demo/view/splash_screen.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  // ignore: library_private_types_in_public_api
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  void changeTheme(ThemeMode themeMode) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.light,
      // themeMode: _themeMode,
      // darkTheme: ThemeData(
      //   primaryColor: Colors.red,
      // ),
      // theme: ThemeData(
      //   primaryColor: Colors.yellow,
      // ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,

      // STACK ROUTING

      // routes: {
      //   '/loginPage': (_) => const LoginPage(title: "Login Page"),
      //   "/myHomePage": (_) => const MyHomePage(userName: "Raj Patel"),
      //   "/profile": (_) => const Profile(),
      //   "/setting": (_) => const Setting(),
      // },

      // ROUTE GENERATOR
      // initialRoute: "/",
      // onGenerateRoute: RouteGenrator.generateRoute,
    );
  }
}
