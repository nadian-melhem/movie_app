import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/details/components/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  final Movie movie;
  String username;

  DetailsScreen({this.username, Key key, this.movie}) : super(key: key);
  _DetailsScreen createState() => _DetailsScreen();
}

class _DetailsScreen extends State<DetailsScreen> {
  bool fav;
  @override
  void initState() {
    super.initState();
    print("Tamer from datil screen");
  }

  checkIfFav() async {
    final data = jsonEncode({
      'username': widget.username,
      'moviename': widget.movie.original_title
    });
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final url = Uri.parse('http://192.168.1.14:5000/checkfavorite');
    var jsonResponse = null;
    var response = await http.post(url, headers: headers, body: data);
    String type;
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      type = jsonResponse['message'];
      if (type == "True")
        fav = true;
      else
        fav = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("hi");

    return Scaffold(
        body: FutureBuilder(
            future: checkIfFav(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> text) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Body(widget.movie, fav),
              );
            }));
  }
}
