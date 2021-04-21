import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie.dart';

class RecMoviesRequest {
  RecMoviesRequest();
  Future<List<Movie>> searchMovie(movieName) async {
    final response =
        await http.get(Uri.https('localhost:27017', 'RECmovie', movieName));
    return compute(parseMovies, response.body);
  }

  List<Movie> parseMovies(String responseBody) {
    final parsed = jsonDecode(responseBody);

    return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
  }

  /*void sendRequest() {
    FutureBuilder<List<Movie>>(
      future: fetchMovie(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? snapshot.data
            : Center(child: CircularProgressIndicator());
      },
    );
  }*/
}
