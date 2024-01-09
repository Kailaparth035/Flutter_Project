// import 'package:flutter/material.dart';

// import 'package:flutter_demo/view/ErrorPage.dart';
// import 'package:flutter_demo/view/Setting.dart';
// import 'package:flutter_demo/view/home_page.dart';
// import 'package:flutter_demo/view/login_page.dart';
// import 'package:flutter_demo/view/onboarding_page.dart';
// import 'package:flutter_demo/view/profile.dart';

// class RouteGenrator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     var arg = settings.arguments;
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => const OnBoardingPage());
//       case '/loginPage':
//         if (arg is String) {
//           return MaterialPageRoute(builder: (_) => const LoginPage(title: arg));
//         }
//       case '/myHomePage':
//         if (arg is String) {
//           return MaterialPageRoute(
//               builder: (_) => const MyHomePage(userName: arg));
//         }
//       case '/profile':
//         return MaterialPageRoute(builder: (_) => const Profile());
//       case '/Setting':
//         return MaterialPageRoute(builder: (_) => const Setting());
//       default:
//         return MaterialPageRoute(builder: (_) => const ErrorPage());
//     }
//   }
// }
