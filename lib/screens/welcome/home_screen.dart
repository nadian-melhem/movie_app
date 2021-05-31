import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/registration_components/rounded_button.dart';
import 'package:movie_app/screens/log_in/log_in.dart';
import 'package:movie_app/screens/prediction/home.dart';
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
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text("Are You a Guest ?   ",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(fontWeight: FontWeight.w600, color: kTextColor)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Prediction();
                    },
                  ),
                );
              },
              child: Text("Predict",
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontWeight: FontWeight.bold, color: kTextColor)),
            ),
          ]),
        ]),
      )
    ]);
  }
}
