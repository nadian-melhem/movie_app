import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/components/already_have.dart';
import 'package:movie_app/components/divider.dart';
import 'package:movie_app/components/rounded_button.dart';
import 'package:movie_app/components/rounded_input.dart';
import 'package:movie_app/components/rounded_password.dart';
import 'package:movie_app/components/social_icon.dart';
import 'package:movie_app/screens/custome_dialog.dart';
import 'package:movie_app/screens/home/components/body.dart';
import 'package:movie_app/screens/log_in/log_in.dart';
import 'package:movie_app/screens/welcome/body.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBody(),
    );
  }
}

class SignUpBody extends StatefulWidget {
  @override
  Body createState() => Body();
}

class Body extends State<SignUpBody> {
  @override
  bool _isLoading;
  String username, passwored, email;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset("assets/icons/cinema.svg",
                height: size.height * 0.35),
            RoundedInput(
              hintText: "Your Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedInput(
              hintText: "Your Username",
              onChanged: (value) {
                username = value;
              },
            ),
            RoundedPassword(
              onChanged: (value) {
                passwored = value;
              },
            ),
            RoundedButton(
                text: "sign up",
                press: () {
                  signUp(username, passwored, email);
                }),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  signUp(String username, passwored, email) async {
    print(username + passwored);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final data = jsonEncode(
        {'password': passwored, 'username': username, 'email': email});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final url = Uri.parse('http://192.168.1.14:5000/signup');
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
                  title: "SignUp Failed",
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
              MaterialPageRoute(builder: (BuildContext context) => MainPage()),
              (Route<dynamic> route) => false);
          print(response.body);
        }
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialogBox(
                  title: "Success",
                  descriptions: message,
                  text: "Ok",
                  img: SvgPicture.asset("assets/icons/check-mark.svg"));
            });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
}
