import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/profile/body.dart';

class Profile extends StatelessWidget {
  String username, email;
  Profile(username, email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/profile1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Name(username, email),
        ));
  }
}
