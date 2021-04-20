import 'package:flutter/cupertino.dart';

import 'movie.dart';

class TopMoviesList {
  final List<Movie> movies;

  TopMoviesList({Key key, this.movies});

  String getTitle(index) {
    return movies[index].original_title;
  }

  int getVote(index) {
    return movies[index].vote_average;
  }

  double getRuntime(index) {
    return movies[index].runtime;
  }

  String getOvervies(index) {
    return movies[index].overview;
  }

  List<String> getCast(index) {
    return movies[index].cast;
  }

  List<String> getGenres(index) {
    return movies[index].genres;
  }

  String getDirector(index) {
    return movies[index].director;
  }

  String getPosterPath(index) {
    return movies[index].poster_path;
  }
}
