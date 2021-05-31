import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/components/body.dart';
import 'package:movie_app/screens/prediction/home.dart';
import 'package:movie_app/screens/welcome/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/welcome.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: HomeScreen(),
        ));
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:movie_app/screens/profile/body.dart';
// import 'package:movie_app/screens/profile/home.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   String username = "Nadian", email = "nadian@gmail.com", passwored = "12345";
//   MyApp();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Profile(username, email, passwored),
//     );
//   }
// }
