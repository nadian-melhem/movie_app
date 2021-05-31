//import 'dart:html';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/httpFiles/favourite_movies.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/home/components/movie_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class FavTap extends StatelessWidget {
  String user = " ";
  FavTap(this.user);

  @override
  Widget build(BuildContext context) {
    print("user" + user);
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
          appBar: AppBar(
            title: Text("Favorite Movies", style: TextStyle(color: kTextColor)),
            backgroundColor: Colors.transparent,
          ),
          body: Fav(user),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Fav extends StatefulWidget {
  String username = " ";
  Fav(this.username);
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
        builder: (context) => MovieCard(widget.username, item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("widget" + widget.username);
    return FutureBuilder<List<Movie>>(
        future: request.favMovie(widget.username),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
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
    return Container(
        child: StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: movies.length,
      itemBuilder: (context, index) => GestureDetector(
          child: Image.network("https://image.tmdb.org/t/p/original" +
              movies[index].poster_path),
          onTap: () => this.itemClick(this.movies[index])),
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 8.0,
    ));
  }
}
