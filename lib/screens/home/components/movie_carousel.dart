import 'dart:core';

import 'package:flutter/material.dart';
import 'package:movie_app/httpFiles/top_movies.dart';

import 'dart:math' as math;

import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/explore%20people/person_tap.dart';
import '../../../constants.dart';
import 'movie_card.dart';

// ignore: must_be_immutable
class MovieCarousel extends StatefulWidget {
  List<Movie> movies = [];
  final String username;
  @override
  MovieCarousel(this.movies, this.username);

  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  PageController _pageController;
  final TopMoviesRequest request = new TopMoviesRequest();
  var futureList;
  int initialPage = 1;
  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) => buildMovieSlider(index),
        ),
      ),
    );
  }

  Widget buildMovieSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = index - _pageController.page;
            value = (value * 0.038).clamp(-1, 1);
          }

          return AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: MovieCard(widget.username, widget.movies[index]),
              // child: recTap(),
            ),
          );
        },
      );
}
