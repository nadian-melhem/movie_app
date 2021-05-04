import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/httpFiles/futureTop.dart';
import 'package:movie_app/httpFiles/top_movies.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/log_in/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'categories.dart';
import 'genres.dart';
import 'movie_carousel.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
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
