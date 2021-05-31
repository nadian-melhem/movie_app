import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/person.dart';

class ExplorePeopleRequest {
  ExplorePeopleRequest();
  Future<List<Person>> fetchNames(username, flag) async {
    var url;
    final data = jsonEncode({'username': username});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    if (flag)
      url = Uri.parse('http://192.168.1.14:5000/explorefollowers');
    else
      url = Uri.parse('http://192.168.1.14:5000/followers');
    final response = await http.post(url, headers: headers, body: data);
    print(response.body);
    return compute(parsePerson, response.body);
  }
}

List<Person> parsePerson(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return parsed.map<Person>((json) => Person.fromJson(json)).toList();
}
