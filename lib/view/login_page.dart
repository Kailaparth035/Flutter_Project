import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/base/common_button.dart';
import 'package:flutter_demo/view/home_page.dart';
import 'package:flutter_demo/view/theme_controler.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

// createState
// when value save in setState that time ui update
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName = "";
  Timer? _timer;

// constructor
  _LoginPageState() {
    // ignore: avoid_print
    print("======== _LoginPageState ========");
    userName = "Raj";
  }

//  initState
//  If screen open then any connection and any initialize value check in this function
//  Work same as a react native useEffect
// Execute one time when screen open
  @override
  void initState() {
    // ignore: avoid_print
    print("==========Initialize state ==============");
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // ignore: avoid_print
      print('Timer tick');
    });
    super.initState();
  }

//didChangeDependencies
// any value change in dependency then call
  @override
  void didChangeDependencies() {
    userName = "didChangeDependencies";
    // print("==========didChangeDependencies state ==============");

    super.didChangeDependencies();
  }

// didUpdateWidget
// Any value change that time any condition and any thing check then call
  @override
  void didUpdateWidget(covariant LoginPage oldWidget) {
    // This method is called whenever the associated widget is updated with a new instance.
    // You can use it to respond to changes in the widget's properties or configuration.
    if (widget == oldWidget) {
      // Reset the counter if the widget instance has changed
      userName = "didUpdateWidget";
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    super.deactivate();
    // This method is called when the state object is removed from the widget tree.
    // It's an opportunity to pause ongoing processes or perform cleanup.
    _timer?.cancel();
    // Cancel the timer to avoid memory leaks or unnecessary callbacks
    // print('Deactivated: Timer canceled');
  }

  // dispose method
  //  call when class is destroyed
  @override
  void dispose() {
    // ignore: avoid_print
    print("==========dispose method ============== $userName");
    super.dispose();
  }

  final ThemeControler _themeControler = Get.put(ThemeControler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text("name :${controller.getUserName}"),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  userName = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            CommonButton(
                buttonText: "Login",
                onPressed: () {
                  Get.to(MyHomePage(
                    userName: userName,
                  ));
                  // _themeControler.changeUserName("Rajkot");
                  // controller.changeUserName("RajKumar");
                  // Get.to(() => {const MyHomePage(userName: "RajKumar")});
                  // Navigator.of(context)
                  //     .pushNamed("/myHomePage", arguments: userName);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => MyHomePage(userName: userName)),
                  // );
                }),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}
