import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/details/details_screen.dart';
import '../../../constants.dart';

// ignore: must_be_immutable
class MovieCard extends StatefulWidget {
  final Movie movie;
  final String username;
  MovieCard(this.username, this.movie);
  _MovieCard createState() => _MovieCard();
}

class _MovieCard extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    print(widget.username);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedBuilder: (context, action) => buildMovieCard(context),
        openBuilder: (context, action) =>
            DetailsScreen(movie: widget.movie, username: widget.username),
      ),
    );
  }

  Widget buildMovieCard(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  // borderRadius: BorderRadius.circular(80),
                  boxShadow: [kDefaultShadow],
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.movie
                        .poster_path), // here will be the image from database
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: Text(
                widget.movie
                    .original_title, // here will be the title from database
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.w600, color: kTextColor),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/icons/star_fill.svg",
                  height: 20,
                ),
                /* FavoriteButton(
              valueChanged: (_isFavorite) {
                print('Is Favorite $_isFavorite)');
              },
            ),*/
                SizedBox(width: kDefaultPadding / 2),
                Text(
                  "${widget.movie.vote_average}", // here will be the rating from database
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w600, color: kTextColor),
                ),
              ],
            )
          ],
        ));
  }
}
