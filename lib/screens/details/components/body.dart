import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/models/movie.dart';
import 'backdrop_rating.dart';
import 'cast_and_crew.dart';
import 'title_duration_and_fav_btn.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  final Movie movie;
  bool fav;
  Body(this.movie, this.fav) {
    print("inside body constructer");
    print(fav);
  }
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BackdropAndRating(size, widget.movie, widget.fav
              // topMovies: null,
              ),
          SizedBox(height: kDefaultPadding / 2),
          TitleDurationAndFabBtn(movie: widget.movie),
          // Genres(movie: movie),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2,
              horizontal: kDefaultPadding,
            ),
            child: Text(
              "Plot Summary",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.w600, color: kTextColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              widget.movie.overview,
              style: TextStyle(
                color: Color(0xFF737599),
              ),
            ),
          ),
          CastAndCrew(casts: widget.movie.cast),
        ],
      ),
    );
  }
}
