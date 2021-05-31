import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/httpFiles/exploreMovies.dart';
import 'package:movie_app/models/movie.dart';
import 'carousel.dart';

// ignore: must_be_immutable
class FavouritFuture extends StatelessWidget {
  String name;
  FavouritFuture({this.name});
  int selecteditem = 0;
  dynamic sdata;
  final ExploreMoviesRequest request = new ExploreMoviesRequest();
  Future<List<Movie>> futureMovie;

  @override
  Widget build(BuildContext context) {
    futureMovie = request.exploreMovie(name);
    return Container(
      color: Colors.transparent,
      child: FutureBuilder<List<Movie>>(
          future: futureMovie,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print("inside personFavourite");
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
