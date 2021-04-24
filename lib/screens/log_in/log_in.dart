import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/components/already_have.dart';
import 'package:movie_app/components/rounded_button.dart';
import 'package:movie_app/components/rounded_input.dart';
import 'package:movie_app/components/rounded_password.dart';
import 'package:movie_app/screens/sign_up/sign_up.dart';
import 'package:movie_app/screens/welcome/body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            onChanged: (value) {},
          ),
          RoundedPassword(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "LogIn",
            // here will be the auth
            //   press: onLogin(AuthCallback) {},
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
}
