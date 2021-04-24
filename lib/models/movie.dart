class Movie {
  final String original_title;
  final int vote_average;
  final double runtime;
  final String overview;
  final List<String> cast;
  final List<String> genres;
  final String director;
  final String poster_path;
  final String year;

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
    return Movie(
        original_title: json['original_title'],
        vote_average: json['vote_average'],
        runtime: json['runtime'],
        // overview: json['overview'],
        cast: json['cast'],
        genres: json['genres'],
        director: json['director'],
        poster_path: json['poster_path'],
        year: json['year']);
  }
}
