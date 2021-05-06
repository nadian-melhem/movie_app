import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie.dart';

class FavMoviesRequest {
  FavMoviesRequest();
  Future<List<Movie>> favMovie(user) async {
    final data = jsonEncode({'user': user});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final url = Uri.parse('http://192.168.1.14:5000/favorite');
    final response = await http.post(url, headers: headers, body: data);
    return compute(parseMovies, response.body);
  }
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
