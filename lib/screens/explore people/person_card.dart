import 'package:flutter/material.dart';
import 'package:movie_app/models/person.dart';
import 'package:movie_app/screens/explore%20people/body.dart';

// ignore: must_be_immutable
class PersonCard extends StatelessWidget {
  String name, username;
  bool flag;
  PersonCard({this.username, this.name, this.flag});
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/personCard.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Body(username, name, flag),
      ),
    );
  }
}
