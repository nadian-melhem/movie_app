//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/httpFiles/favourite_movies.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/home/components/body.dart';

class FavTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kSecondaryColor,
        centerTitle: true,
        title: Text("Favoutrit Movies"),
        backgroundColor: kSecondaryColor,
      ),
      body: Fav(),
    );
  }
}

class Fav extends StatelessWidget {
  Fav({Key key}) : super(key: key);
  Future<List<Movie>> futureMovies;
  List<Movie> movies;
  void func() {
    FavMoviesRequest request = new FavMoviesRequest();
    futureMovies = request.favMovie();
    movies = futureMovies as List<Movie>;
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: movies.length,
      itemBuilder: (context, index) => Image.network(movies[index].poster_path),
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}

/*class ImageCard extends StatelessWidget {
  const ImageCard({this.imageData});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(imageData.imageUrl, fit: BoxFit.cover),
    );
  }
}*/
