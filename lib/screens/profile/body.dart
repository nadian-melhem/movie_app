import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movie_app/registration_components/rounded_input.dart';
import 'package:movie_app/screens/favourite/favourite_tap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Name extends StatefulWidget {
  String username, email;
  Name(username, email);
  _Name createState() => _Name();
}

class _Name extends State<Name> {
  String passwored = "********";

  String newUsername;

  String newEmail;

  var newPasswored;
  _Name();
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
        // Expanded(
        //     flex: 1,
        //     child: SizedBox(
        //         child: Stack(children: [
        //       Positioned(
        //         top: 200,
        //         right: 160,
        //         child: IconButton(
        //           icon: Icon(Icons.favorite),
        //           color: Colors.white,
        //           iconSize: 40,
        //           onPressed: () {},
        //         ),
        //       )
        //     ]))),
        Expanded(
            flex: 2,
            child: SizedBox(
                child: Stack(children: [
              Positioned(
                //top: 30,
                right: 280,
                child: Text(widget.username,
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
                  hintText: widget.username,
                  onChanged: (value) {
                    newUsername = value;
                    setUserName(widget.username);
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
                  hintText: widget.email,
                  onChanged: (value) {
                    newEmail = value;
                    setEmail(widget.username);
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
                    setPasswored(widget.username);
                  },
                ),
              )
            ]))),
      ],
    ));
  }

  setUserName(String username) async {
    final data = jsonEncode({'username': username, 'newuser': newUsername});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final url = Uri.parse('http://192.168.1.14:5000/editUser');
    var response = await http.post(url, headers: headers, body: data);
    if (response.statusCode == 200) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("user", newUsername);
    }
  }

  Future<void> setEmail(String username) async {
    final data = jsonEncode({'username': username, 'newEmail': newEmail});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final url = Uri.parse('http://192.168.1.14:5000/editEmail');
    var response = await http.post(url, headers: headers, body: data);
    if (response.statusCode == 200) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("email", newEmail);
    }
  }

  Future<void> setPasswored(String username) async {
    final data =
        jsonEncode({'username': username, 'newPasswored': newPasswored});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final url = Uri.parse('http://192.168.1.14:5000/editPasswored');
    var response = await http.post(url, headers: headers, body: data);
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
