import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/profile/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'body.dart';

class Profile extends StatefulWidget {
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
          child: Predict(),
        ));
  }
}
