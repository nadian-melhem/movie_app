import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/httpFiles/futureTop.dart';
import 'package:movie_app/httpFiles/top_movies.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/home/components/side_menu.dart';
import 'package:movie_app/screens/log_in/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'categories.dart';
import 'genres.dart';
import 'movie_carousel.dart';

String username;

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(),
          body: Body(),
          drawer: NavDrawer(username),
        ),
      ),
    );
  }
}

AppBar buildAppBar() {
  var appBar = AppBar(
    leading: IconButton(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      icon: Icon(Icons.menu),
      color: kSecondaryColor,
      onPressed: () {},
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
  return appBar;
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
    username = sharedPreferences.getString("user");
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
    NavDrawer(username);
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
