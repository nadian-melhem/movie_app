import 'package:flutter/material.dart';
import 'package:movie_app/screens/explore%20people/body.dart';

class PersonCard extends StatelessWidget {
  String name;
  PersonCard({this.name});
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/personalCard.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Body(name: name),
      ),
    );
  }
}
