import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/home/components/body.dart';

class FavTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.red,
        centerTitle: true,
        title: Text("Favoutrit Movies"),
        backgroundColor: Colors.red,
      ),
      body: Fav(),
    );
  }
}

class Fav extends StatelessWidget {
  const Fav({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: movies.length,
      itemBuilder: (context, index) => ImageCard(
        imageData: movies[index],
      ),
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}
