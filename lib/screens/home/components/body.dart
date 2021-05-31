import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/screens/explore%20people/person_tap.dart';
import 'package:movie_app/screens/home/components/futureTop.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/screens/home/components/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'categories.dart';
import 'genres.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  String user, email;
  MainPage(this.user, this.email);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          body: Body(user),
          drawer: NavDrawer(user, email),
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
  String user = " ";
  Body(this.user);
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
    String user = sharedPreferences.getString("user");
    String email = sharedPreferences.getString("email");
    if (sharedPreferences.getString("user") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => MyApp()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Categorylist();
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Categorylist(),
        Genres(),
        SizedBox(height: kDefaultPadding),
        TopFuture(widget.user),
      ]),
    );
  }
}
