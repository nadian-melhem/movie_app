//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/httpFiles/favourite_movies.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/home/components/movie_card.dart';

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

class Fav extends StatefulWidget {
  @override
  _Fav createState() => _Fav();
}

class _Fav extends State<Fav> {
  FavMoviesRequest request = new FavMoviesRequest();
  void initState() {
    super.initState();
  }

  void itemClick(Movie item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieCard(movie: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
        future: request.favMovie(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
                child:
                    FavCard(movies: snapshot.data, itemClick: this.itemClick));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}

class FavCard extends StatelessWidget {
  final List<Movie> movies;
  final Function itemClick;
  const FavCard({Key key, this.movies, this.itemClick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: movies.length,
      itemBuilder: (context, index) => Image.network(
          "https://image.tmdb.org/t/p/original" + movies[index].poster_path),
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}
