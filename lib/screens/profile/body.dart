import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/registration_components/rounded_input.dart';
import 'package:movie_app/registration_components/rounded_password.dart';
import 'package:movie_app/screens/favourite/favourite_tap.dart';

class Name extends StatelessWidget {
  String username = "Nadian",
      email = "nadian@gmail.com",
      passwored = "********";
  Name(username, email);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
      children: [
        Expanded(
            flex: 4,
            child: SizedBox(
                child: Stack(children: [
              Positioned(
                top: 200,
                right: 40,
                child: Row(children: [
                  IconButton(
                    icon: Icon(Icons.favorite),
                    color: Colors.white,
                    iconSize: 40,
                    onPressed: () {
                      FavTap();
                    },
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  IconButton(
                    icon: Icon(Icons.people),
                    color: Colors.white,
                    iconSize: 40,
                    onPressed: () {},
                  ),
                ]),
              )
            ]))),
        Expanded(
            flex: 1,
            child: SizedBox(
                child: Stack(children: [
              Positioned(
                top: 200,
                right: 160,
                child: IconButton(
                  icon: Icon(Icons.favorite),
                  color: Colors.white,
                  iconSize: 40,
                  onPressed: () {},
                ),
              )
            ]))),
        Expanded(
            flex: 2,
            child: SizedBox(
                child: Stack(children: [
              Positioned(
                //top: 30,
                right: 280,
                child: Text(username,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              )
            ]))),
        Expanded(
            flex: 1,
            child: SizedBox(
                child: Stack(children: [
              Positioned(
                left: 50,
                child: RoundedInput(
                  hintText: username,
                  onChanged: (value) {
                    username = value;
                  },
                ),
              )
            ]))),
        Expanded(
            flex: 1,
            child: SizedBox(
                child: Stack(children: [
              Positioned(
                left: 50,
                child: RoundedInput(
                  hintText: email,
                  onChanged: (value) {
                    email = value;
                  },
                ),
              )
            ]))),
        Expanded(
            flex: 1,
            child: SizedBox(
                child: Stack(children: [
              Positioned(
                left: 50,
                child: RoundedInput(
                  hintText: passwored,
                  onChanged: (value) {
                    passwored = value;
                  },
                ),
              )
            ]))),
      ],
    ));
  }
}

class Boxes extends StatelessWidget {
  String username = "Nadian", email = "nadian@gmail.com", passwored = "123456";
  Boxes(username, email, passwored);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
      children: [
        Expanded(
            flex: 3,
            child: SizedBox(
                height: 70.0,
                child: Stack(children: [
                  Positioned(
                    top: 335,
                    right: 280,
                    child: Text(username,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  )
                ]))),
      ],
    ));
  }
}
