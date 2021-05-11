import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/profile/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  final username, email;
  Profile(this.username, this.email);
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/predict.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Name(widget.username, widget.email),
        ));
  }
}
