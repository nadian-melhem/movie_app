import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/explore%20people/person_tap.dart';

import '../../constants.dart';

class FollowersBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              flexibleSpace: Image(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
              title: Center(
                  child: Text(
                'People you Follow',
                style: TextStyle(color: kTextColor),
              )),
              backgroundColor: Colors.transparent,
            ),
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                )),
                child: PersonTap(false))));
  }
}
