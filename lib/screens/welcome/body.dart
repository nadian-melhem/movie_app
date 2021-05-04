import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/components/rounded_button.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/screens/log_in/log_in.dart';
import 'package:movie_app/screens/sign_up/sign_up.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/welcome.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              SizedBox(height: size.height * 0.05),
              /* SvgPicture.asset(
            "assets/icons/cinema.svg",
            height: size.height * 0.45,
          ),*/
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                  text: "LogIn",
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
                text: "SignUP",
                color: kSecondaryColor,
                textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SignUpScreen();
                    }),
                  );
                },
              ),
              /*  RoundedButton(
                text: "LogIn as guest",
                color: kSecondaryColor,
                textColor: kTextLightColor,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SignUpScreen();
                    }),
                  );
                },
              )*/
            ])));
  }
}
