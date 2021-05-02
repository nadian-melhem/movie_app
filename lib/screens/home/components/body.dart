import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/httpFiles/futureTop.dart';
import 'package:movie_app/httpFiles/top_movies.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/log_in/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'categories.dart';
import 'genres.dart';
import 'movie_carousel.dart';

class MainPage extends StatefulWidget {
  @override
  Body createState() => Body();
}

class Body extends State<MainPage> {
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("user") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // it enable scroll on small device
    Categorylist();
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Categorylist(),
        Genres(),
        SizedBox(height: kDefaultPadding),
        TopFuture(),
      ]),
    );
  }
}
