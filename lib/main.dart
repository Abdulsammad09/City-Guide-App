
import 'package:citieguide/auth/login.dart';
import 'package:flutter/material.dart';

import 'App/WelcomeScreen.dart';


var Url = "http://192.168.2.102/flutterimage/";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}








//
// class Homescreen extends StatelessWidget {
//   const Homescreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//         backgroundColor: Colors.blueAccent,
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Welcome Home!',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blueAccent,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'You have successfully logged in.',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey[700],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 40),
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigate to another screen or perform some action
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blueAccent,
//                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Text(
//                   'Get Started',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Logout action
//                   Navigator.pop(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.redAccent,
//                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Text(
//                   'Logout',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
 //       ),
//     );
//   }
// }
//
