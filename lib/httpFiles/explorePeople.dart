import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ExplorePeopleRequest {
  ExplorePeopleRequest();

  Future<List<String>> fetchNames() async {
    final response = await http.get(Uri.http('192.168.1.14:5000', 'TOPmovie'));

    return response;
  }
}
