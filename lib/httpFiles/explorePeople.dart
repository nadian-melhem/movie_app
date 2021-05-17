import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ExplorePeopleRequest {
  ExplorePeopleRequest();

  // ignore: missing_return
  Future<List<String>> fetchNames(String username, bool flag) async {
    var url;
    final data = jsonEncode({'username': username});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    if (flag)
      url = Uri.parse('http://192.168.1.14:5000/explore');
    else
      url = Uri.parse('http://192.168.1.14:5000/followers');
    final response = await http.post(url, headers: headers, body: data);
    // return compute(parseMovies, response.body);
  }
}
/*
List<String> parseMovies(String responseBody) {
  final parsed = jsonDecode(responseBody);

  return parsed.map<String>((json) => Movie.fromJson(json)).toList();
}*/
