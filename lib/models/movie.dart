import 'dart:convert';

class Movie {
  final String original_title;
  final double vote_average;
  final double runtime;
  final String overview;
  List<String> cast;
  final List<String> genres;
  final String director;
  final String poster_path;
  final int year;

  Movie(
      {this.original_title,
      this.vote_average,
      this.runtime,
      this.overview,
      this.cast,
      this.genres,
      this.director,
      this.poster_path,
      this.year});

  factory Movie.fromJson(Map<String, dynamic> json) {
    var castFromjson = json['cast'];
    List<String> castList = new List<String>.from(castFromjson);
    var genresFromjson = json['genres'];
    List<String> genresList = new List<String>.from(genresFromjson);
    return Movie(
        original_title: json['original_title'],
        vote_average: json['vote_average'],
        runtime: json['runtime'],
        overview: json['overview'],
        cast: castList,
        genres: genresList,
        director: json['director'],
        poster_path: json['poster_path'],
        year: json['year']);
  }
}
