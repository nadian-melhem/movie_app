import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/components/already_have.dart';
import 'package:movie_app/components/rounded_button.dart';
import 'package:movie_app/components/rounded_input.dart';
import 'package:movie_app/components/rounded_password.dart';
import 'package:movie_app/screens/sign_up/sign_up.dart';
import 'package:movie_app/screens/welcome/body.dart';
import 'package:movie_app/screens/welcome/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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
    return Background(
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
            press: () {},
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

  logIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': pass};
    var jsonResponse = null;
    var response = await http.post(
      Uri.http('192.168.1.14:5000', 'login'),
      body: data,
    );
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
}
