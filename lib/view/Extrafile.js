// ************ button ***********//

// body: Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       CommonButton(
//         buttonText: 'Go to HomeScreen',
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => MyHomePage(),
//             ),
//           );
//         },
//       ),
//     ],
//   ),
// ),

// ************ center ***********//

// body: Center(
//   child: Container(
//     color: Colors.blue,
//     child: Center(
//       child: ElevatedButton(
//         child: Text("EleventedButton"),
//         onPressed: () {
//           print("Button Click!");
//         },
//       ),
//       // TextButton(
//       //   child: Text(
//       //     "Click Here",
//       //     style: TextStyle(color: Colors.white),
//       //   ),
//       //   onPressed: () => {
//       //     print("Click button"),
//       //   },
//       // ),
//       //    Text(
//       //   "Flutter",
//       //   style: TextStyle(
//       //       fontSize: 25,
//       //       fontWeight: FontWeight.w600,
//       //       color: Colors.white),
//       // ),
//     ),

//     width: 200,
//     height: 200,

//     // decoration: BoxDecoration(border: 1, borderRadius: 20),
//   ),
// ),

// ************ row,colum,inkwell,image ***********//

// body: Center(
//   child: Container(
//     child: Center(
//       child: Row(
//         children: [
//           Column(
//             children: [
//               Image.asset(
//                 "assets/images/background.jpg",
//                 cacheWidth: 100,
//                 cacheHeight: 100,
//               ),
//               Text("Column1"),
//               Text("Column1")
//             ],
//             mainAxisSize: MainAxisSize.max,
//           ),
//           Column(
//             children: [
//               Text("Column2"),
//               Text("Column2"),
//               InkWell(
//                 child: Image.asset(
//                   "assets/images/background.jpg",
//                   cacheWidth: 100,
//                   cacheHeight: 100,
//                 ),
//                 onTap: () {
//                   print("Hello")
//                 },
//               )
//             ],
//           )
//         ],
//       ),
//     ),
//     width: 200,
//     height: 200,
//     color: Colors.greenAccent,
//   ),
// ),

// ************ scrollView ***********//

// body: Container(
//   child: Center(
//       child: SingleChildScrollView(
//           child: Column(children: [
//     Container(
//       margin: EdgeInsets.only(bottom: 10, top: 10),
//       color: Colors.red,
//       height: 100,
//     ),
//     Container(
//       margin: EdgeInsets.only(bottom: 15),
//       color: Colors.yellow,
//       height: 100,
//     ),
//     Container(
//       margin: EdgeInsets.only(bottom: 15),
//       color: Colors.green,
//       height: 100,
//     ),
//     Container(
//       margin: EdgeInsets.only(bottom: 15),
//       color: Colors.black,
//       height: 100,
//     ),
//     Container(
//       margin: EdgeInsets.only(bottom: 15),
//       color: Colors.red,
//       height: 100,
//     ),
//     Container(
//       margin: EdgeInsets.only(bottom: 15),
//       color: Colors.yellow,
//       height: 100,
//     ),
//     Container(
//       margin: EdgeInsets.only(bottom: 15),
//       color: Colors.green,
//       height: 100,
//     ),
//     Container(
//       margin: EdgeInsets.only(bottom: 15),
//       color: Colors.black,
//       height: 100,
//     )
//   ]))),
// ),

// list show

// body: Column(
//     children: [
//       Container(
//         height: 300,
//         child: ListView.builder(
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child:
//                   CommonButton(buttonText: names[index], onPressed: () {}),
//             );
//           },
//           itemCount: names.length,
//         ),
//       ),
//       Container(
//         height: 300,
//         child: ListView.builder(
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child:
//                   CommonButton(buttonText: names[index], onPressed: () {}),
//             );
//           },
//           itemCount: names.length,
//         ),
//       ),
//     ],
//   ),

//  theme implement in text

// SizedBox(
//     height: 500,
//     width: 100,
//     child: ListView.builder(
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       "123",
//                       style: TextStyle(
//                           color: Theme.of(context).primaryColor),
//                     ),
//                     const Text("123"),
//                   ],
//                 ),
//               ),
//             ),
//             const Card(
//               child: Text("123"),
//             ),
//           ],
//         );
//       },
//     ),
//   ),
