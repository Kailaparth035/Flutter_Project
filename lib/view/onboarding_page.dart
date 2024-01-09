import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_demo/view/login_page.dart';
import 'package:get/get.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({
    super.key,
  });

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

var data = [1, 2, 3, 4, 5];

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 560,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (index, _) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            items: data.map((int i) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 560,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/inroductionBackground.png',
                          height: 580,
                          width: double.infinity,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.fill,
                        ),
                        Positioned.fill(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/images/qaLogo.png",
                                    height: 200,
                                    width: 200,
                                  ),
                                ),
                                Text(
                                  "Outfil Archives $i",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: data.map((item) {
              int index = data.indexOf(item);
              return Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      currentIndex == index ? Colors.blueAccent : Colors.grey,
                ),
              );
            }).toList(),
          ),
          Container(
            color: const Color(0xDECBBCF5),
            width: double.infinity,
            child: const Padding(
              padding:
                  EdgeInsets.only(bottom: 25, top: 15, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Track Your",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Outfits",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  Divider(
                    color: Color.fromARGB(255, 255, 255, 255),
                    thickness: 1.5,
                  ),
                  Text(
                    "Get inspired by others",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 500,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(0), // Adjust the value as needed
                  ),
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18)),
              onPressed: () {
                Get.to(const LoginPage(
                  title: "Login User",
                ));

                // Navigator.of(context)
                //     .pushNamed("/loginPage", arguments: "Login From Route");

                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //       builder: (context) => const LoginPage(
                //             title: "Login User",
                //           )),
                // );
              },
              child: const Center(
                child: Text(
                  "GET STARTED",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
