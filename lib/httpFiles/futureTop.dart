import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/httpFiles/top_movies.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/home/components/movie_carousel.dart';
import '../constants.dart';

// ignore: must_be_immutable
class TopFuture extends StatelessWidget {
  int selecteditem = 0;
  dynamic sdata;
  final TopMoviesRequest request = new TopMoviesRequest();
  Future<List<Movie>> futureMovie;

  @override
  Widget build(BuildContext context) {
    futureMovie = request.fetchMovie();
    return Container(
      color: Colors.transparent,
      child: FutureBuilder<List<Movie>>(
          future: futureMovie,
          builder: (context, AsyncSnapshot snapshot) {
            // print("tamer");
            if (snapshot.hasData) {
              //  print("hiiiii");
              sdata = snapshot.data;
              return new MovieCarousel(movies: snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          }),
    );
  }
}
