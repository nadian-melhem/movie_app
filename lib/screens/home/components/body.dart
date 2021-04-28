import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/httpFiles/futureTop.dart';
import 'package:movie_app/httpFiles/top_movies.dart';
import 'package:movie_app/models/movie.dart';
import 'categories.dart';
import 'genres.dart';
import 'movie_carousel.dart';

class Body extends StatelessWidget {
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
