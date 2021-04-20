import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/components/rounded_button.dart';
import 'package:movie_app/screens/log_in/log_in.dart';
import 'package:movie_app/screens/sign_up/sign_up.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Text(
            "Movie World",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.05),
          SvgPicture.asset(
            "assets/icons/cinema.svg",
            height: size.height * 0.45,
          ),
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
            color: Colors.red,
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
          RoundedButton(
            text: "LogIn as guest",
            color: Colors.red,
            textColor: Colors.white,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SignUpScreen();
                }),
              );
            },
          )
        ])));
  }
}

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.2,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
