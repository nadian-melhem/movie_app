import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart' as models;

class MovieItem extends StatelessWidget {
  final models.Movie movie;

  MovieItem({this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(children: <Widget>[
            if (this.movie.poster_path != "N/A")
              Image.network(this.movie.poster_path, height: 100, width: 100)
          ]),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.movie.original_title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(this.movie.year.toString()),
                ]),
          )
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 8, left: 10, right: 10),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white),
    );
  }
}
