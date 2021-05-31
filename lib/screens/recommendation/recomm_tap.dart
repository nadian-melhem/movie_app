import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/home/components/movie_card.dart';
import 'package:movie_app/screens/recommendation/recom_movie_list.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/httpFiles/recommended.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

String title, username;

class RecTap extends StatefulWidget {
  @override
  RecTapState createState() => RecTapState();
}

class RecTapState extends State<RecTap> {
  //A controller is required to get the value of the textfield
  final searchTextController = new TextEditingController();
  final RecMoviesRequest request = new RecMoviesRequest();
  String searchText = "";

  @override
  void dispose() {
    //Dispose the controller when the screen is disposed
    searchTextController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    getuserName();
  }

  //When a movie is clicked navigate to the movie detail screen
  void itemClick(Movie item) {
    //The movie details will be passed via the list
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieCard(username, item),
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
                'Search Movies',
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
                      child: Row(children: <Widget>[
                        Flexible(
                          child: TextField(
                            controller: searchTextController,
                            decoration: InputDecoration(
                                hoverColor: kTextColor,
                                hintStyle: TextStyle(color: kTextColor),
                                hintText: 'Enter a search term'),
                            style: TextStyle(color: kTextColor),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search, color: kTextColor),
                          tooltip: 'Search Movies',
                          onPressed: () {
                            setState(() {
                              //Set the state with the new value so that the widget will re render
                              searchText = searchTextController.text;
                              title = searchText;
                              //Hide keyboard when the state is set
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                            });
                          },
                        ),
                      ]),
                      padding: EdgeInsets.all(10),
                    ),
                    //Only send the service request if the keyword is not empty
                    if (searchText.length > 0)
                      //A future builder to render the

                      FutureBuilder<List<Movie>>(
                          //Initiate the service request
                          future: request.searchMovie(title, username),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              //if the response has data render the movie list
                              return Expanded(
                                  child: MovieList(
                                      movies: snapshot.data,
                                      itemClick: this.itemClick));
                            } else if (snapshot.hasError) {
                              //if there is an error show the error message
                              return Text("${snapshot.error}");
                            }
                            //if the service call is in progress show the progress indicator
                            return CircularProgressIndicator();
                          }),
                  ],
                ))));
  }
}
