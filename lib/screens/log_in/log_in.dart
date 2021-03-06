import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/registration_components/already_have.dart';
import 'package:movie_app/registration_components/rounded_button.dart';
import 'package:movie_app/registration_components/rounded_input.dart';
import 'package:movie_app/registration_components/rounded_password.dart';
import 'package:movie_app/screens/sign_up/sign_up.dart';
import 'package:movie_app/screens/home/components/body.dart' as main;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/screens/custome_dialog.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/welcome.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: LogInBody(),
    ));
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
        child: Stack(children: [
      // SizedBox(height: 200),
      Positioned(
          top: 50,
          right: 0,
          left: 0,
          height: 600,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 300),
                RoundedInput(
                  hintText: "Your User Name",
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
                  text: "Sign In",
                  press: () {
                    logIn(userEmail, passwored);
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignUpScreen();
                    }));
                  },
                ),
                SizedBox(height: 200),
              ],
            ),
          ))
    ]));
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
          sharedPreferences.setString("user", jsonResponse['username']);
          sharedPreferences.setString("email", jsonResponse['email']);
          String usertoSend = sharedPreferences.getString('user');
          String emailtoSend = sharedPreferences.getString('email');
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      main.MainPage(usertoSend, emailtoSend)),
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
