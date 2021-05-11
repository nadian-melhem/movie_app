import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movie_app/screens/favourite/favourite_tap.dart';
import 'package:movie_app/screens/profile/profile_input.dart';
import 'package:movie_app/screens/recommendation/recomm_tap.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Predict extends StatefulWidget {
  _Predict createState() => _Predict();
}

class _Predict extends State<Predict> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("inside widget");
    return Container(
        child: Column(
      children: [
        Expanded(
            flex: 2,
            child: SizedBox(
                child: Stack(children: [
              Positioned(
                top: 30,
                right: 280,
                child: Text("Insert Budget",
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
                  },
                  //onpressed: setUserName(widget.username),
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
                  },
                  //    onpressed: setEmail(widget.username),
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
                    newPasswored = value;
                  },
                  //  onpressed: setPasswored(widget.username),
                ),
              )
            ]))),
      ],
    ));
  }

  setUserName(String username) async {
    final data = jsonEncode({'username': username, 'newusername': newUsername});

    var jsonResponse = null;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final url = Uri.parse('http://192.168.1.14:5000/editUser');
    var response = await http.post(url, headers: headers, body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse['type'] == "success") {
        sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("user", newUsername);
      } else {}
    }
  }

  setEmail(String username) async {
    final data = jsonEncode({'username': username, 'newemail': newEmail});
    var jsonResponse = null;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final url = Uri.parse('http://192.168.1.14:5000/editEmail');
    var response = await http.post(url, headers: headers, body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse['type'] == "success") {
        sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("email", newEmail);
      } else {}
    }
  }

  setPasswored(String username) async {
    final data =
        jsonEncode({'username': username, 'newpassword': newPasswored});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final url = Uri.parse('http://192.168.1.14:5000/editPasswored');
    var response = await http.post(url, headers: headers, body: data);
    var jsonResponse = null;
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse['type'] == "success") {}
    }
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
