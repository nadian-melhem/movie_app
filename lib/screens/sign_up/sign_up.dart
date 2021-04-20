import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/components/already_have.dart';
import 'package:movie_app/components/divider.dart';
import 'package:movie_app/components/rounded_button.dart';
import 'package:movie_app/components/rounded_input.dart';
import 'package:movie_app/components/rounded_password.dart';
import 'package:movie_app/components/social_icon.dart';
import 'package:movie_app/screens/log_in/log_in.dart';
import 'package:movie_app/screens/welcome/body.dart';

class SignUpScreen extends StatelessWidget {
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
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset("assets/icons/cinema.svg",
                height: size.height * 0.35),
            RoundedInput(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPassword(
              onChanged: (value) {},
            ),
            RoundedButton(text: "sign up", press: () {}),
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
}
