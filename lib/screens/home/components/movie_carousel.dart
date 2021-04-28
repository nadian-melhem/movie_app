import 'dart:core';

import 'package:flutter/material.dart';
import 'package:movie_app/httpFiles/top_movies.dart';

import 'dart:math' as math;

import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/movieList.dart';
import '../../../constants.dart';
import 'movie_card.dart';

class MovieCarousel extends StatefulWidget {
  List<Movie> movies = [];
  @override
  MovieCarousel({this.movies});

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
      // so that we can have small portion shown on left and right side
      viewportFraction: 0.8,
      // by default our movie poster
      initialPage: initialPage,
    );
    //  futureList = request.fetchMovie();
    //widget.movies = futureList.toList();
    print("i'm hereeeeeeeeeeeeeeeeeeeeeeeee ");
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
          itemCount: 10, // we have 3 demo movies
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
            // We use 0.038 because 180*0.038 = 7 almost and we need to rotate our poster 7 degree
            // we use clamp so that our value vary from -1 to 1
            value = (value * 0.038).clamp(-1, 1);
          }

          return AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: MovieCard(movie: widget.movies[index]),
              // child: recTap(),
            ),
          );
        },
      );
}
