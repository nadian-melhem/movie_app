import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/httpFiles/exploreMovies.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/home/components/movie_card.dart';

// ignore: must_be_immutable
class ExploreTap extends StatelessWidget {
  String user = " ";
  ExploreTap(this.user);

  @override
  Widget build(BuildContext context) {
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
            title: Text("Explore Movies", style: TextStyle(color: kTextColor)),
            backgroundColor: Colors.transparent,
          ),
          body: ExploreBody(user),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ExploreBody extends StatefulWidget {
  String username = " ";
  ExploreBody(this.username);
  @override
  _ExploreBody createState() => _ExploreBody();
}

class _ExploreBody extends State<ExploreBody> {
  ExploreMoviesRequest request = new ExploreMoviesRequest();
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
    return FutureBuilder<List<Movie>>(
        future: request.exploreMovie(widget.username),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                child: InstagramSearchGrid(
                    movies: snapshot.data, itemClick: this.itemClick));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}

class InstagramSearchGrid extends StatelessWidget {
  final List<Movie> movies;
  final Function itemClick;
  const InstagramSearchGrid({Key key, this.movies, this.itemClick})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      itemCount: movies.length,
      itemBuilder: (context, index) => GestureDetector(
          child: Image.network(
            "https://image.tmdb.org/t/p/original" + movies[index].poster_path,
            fit: BoxFit.cover,
          ),
          onTap: () => this.itemClick(this.movies[index])),
      staggeredTileBuilder: (index) => StaggeredTile.count(
          (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
    );
  }
}
