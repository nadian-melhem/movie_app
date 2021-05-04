import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/components/rounded_button.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/screens/home/components/body.dart';
//import 'package:movie_app/screens/home/components/body.dart';
import 'package:movie_app/screens/home/components/side_menu.dart';
import 'package:movie_app/screens/log_in/log_in.dart';
import 'package:movie_app/screens/sign_up/sign_up.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Positioned(
        bottom: 80,
        left: 40,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          SizedBox(height: size.height * 0.05),
          RoundedButton(
              text: "Sign In",
              color: buttoncolor,
              textColor: darkTextcolor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              }),
          RoundedButton(
            text: "Sign UP",
            color: buttoncolor,
            textColor: darkTextcolor,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SignUpScreen();
                }),
              );
            },
          ),
          Text("Sign In as guest",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  color: kTextColor, decoration: TextDecoration.underline))
        ]),
      )
    ]);
  }
}
