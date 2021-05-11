import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/registration_components/already_have.dart';
import 'package:movie_app/registration_components/rounded_button.dart';
import 'package:movie_app/registration_components/rounded_input.dart';
import 'package:movie_app/registration_components/rounded_password.dart';
import 'package:movie_app/screens/custome_dialog.dart';
import 'package:movie_app/screens/home/components/body.dart';
import 'package:movie_app/screens/log_in/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/welcome.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SignUpBody(),
        ));
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
    return Container(
        child: Stack(children: [
      Positioned(
          bottom: 30,
          right: 0,
          left: 0,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                    text: "Sign Up",
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
              ],
            ),
          ))
    ]));
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
                  img: SvgPicture.asset("assets/icons/tick-mark.svg"));
            });
      } else {
        if (jsonResponse != null) {
          setState(() {
            _isLoading = false;
          });
          sharedPreferences.setString("user", jsonResponse['username']);
          sharedPreferences.setString("email", jsonResponse['email']);
          String usertoSend = sharedPreferences.getString('user');
          String emailtoSend = sharedPreferences.getString('email');
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      MainPage(usertoSend, emailtoSend)),
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
                  img: SvgPicture.asset("assets/icons/done.svg"));
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
