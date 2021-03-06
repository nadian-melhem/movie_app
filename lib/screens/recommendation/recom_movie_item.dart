import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart' as models;
import '../../constants.dart';

class MovieItem extends StatelessWidget {
  final models.Movie movie;
  MovieItem({this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          // color: randomColor
          //     .randomColor(colorHue: ColorHue.random)
          //     .withOpacity(1.0)
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(children: <Widget>[
            if (this.movie.poster_path != "N/A")
              Image.network(
                  "https://image.tmdb.org/t/p/original" +
                      this.movie.poster_path,
                  height: 100,
                  width: 100)
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
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        fontWeight: FontWeight.w600, color: kTextColor),
                  ),
                  Text(
                    this.movie.year.toString(),
                    style: TextStyle(color: kTextColor),
                  ),
                ]),
          )
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 8, left: 10, right: 10),
    );
  }
}
