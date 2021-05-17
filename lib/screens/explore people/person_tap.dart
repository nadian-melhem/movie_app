import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/httpFiles/explorePeople.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/explore%20people/person_card.dart';
import 'package:movie_app/screens/explore%20people/person_list.dart';
import 'package:movie_app/screens/home/components/movie_card.dart';
import 'package:movie_app/screens/recommendation/recom_movie_list.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/httpFiles/recommended.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

String title, username;

class PersonTap extends StatefulWidget {
  @override
  PersonTapState createState() => PersonTapState();
}

class PersonTapState extends State<PersonTap> {
  ExplorePeopleRequest request = new ExplorePeopleRequest();
  void initState() {
    super.initState();
    getuserName();
  }

  void itemClick(String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonCard(name: name),
      ),
    );
  }

  getuserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    username = sharedPreferences.getString('user');
  }

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
                'Meet new People',
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
                child: Column(
                  children: <Widget>[
                    Container(
                      child: FutureBuilder<List<String>>(
                          future: request.fetchNames(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Expanded(
                                  child: PeopleList(
                                      names: snapshot.data,
                                      itemClick: this.itemClick));
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }

                            return CircularProgressIndicator();
                          }),
                    )
                  ],
                ))));
  }
}
