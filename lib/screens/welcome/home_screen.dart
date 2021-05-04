import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/screens/home/components/body.dart';
//import 'package:movie_app/screens/home/components/body.dart';
import 'package:movie_app/screens/home/components/side_menu.dart';
import 'package:movie_app/screens/welcome/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: Colors.white,
      //appBar: buildAppBar(),
      body: WelcomeBody(),
    );
  }
}
