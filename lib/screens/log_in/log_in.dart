import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/components/already_have.dart';
import 'package:movie_app/components/rounded_button.dart';
import 'package:movie_app/components/rounded_input.dart';
import 'package:movie_app/components/rounded_password.dart';
import 'package:movie_app/screens/sign_up/sign_up.dart';
import 'package:movie_app/screens/welcome/body.dart';
import 'package:movie_app/screens/home/components/body.dart' as main;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/screens/custome_dialog.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogInBody(),
    );
  }
}

class LogInBody extends StatefulWidget {
  @override
  _LogInBodyState createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    String userEmail, passwored;
    Size size = MediaQuery.of(context).size;
    return Container(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset(
            "assets/icons/cinema.svg",
            height: size.height * 0.35,
          ),
          SizedBox(height: size.height * 0.03),
          RoundedInput(
            hintText: "Your Email",
            onChanged: (value) {
              userEmail = value;
            },
          ),
          RoundedPassword(
            onChanged: (value) {
              passwored = value;
            },
          ),
          RoundedButton(
            text: "LogIn",
            // here will be the auth
            press: () {
              logIn(userEmail, passwored);
            },
          ),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignUpScreen();
              }));
            },
          )
        ],
      ),
    ));
  }

  logIn(String username, passwored) async {
    print(username + passwored);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final data = jsonEncode({'password': passwored, 'username': username});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final url = Uri.parse('http://192.168.1.14:5000/login');
    var jsonResponse = null;
    var response = await http.post(url, headers: headers, body: data);
    String type, message;
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      type = jsonResponse['type'];
      message = jsonResponse['message'];
      if (type == 'failure') {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialogBox(
                  title: "logIn Failed",
                  descriptions: message,
                  text: "Try again",
                  img: SvgPicture.asset("assets/icons/person.svg"));
            });
      } else {
        if (jsonResponse != null) {
          setState(() {
            _isLoading = false;
          });
          sharedPreferences.setString("user", jsonResponse['message']);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => main.MainPage()),
              (Route<dynamic> route) => false);
          print(response.body);
        }
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
}
