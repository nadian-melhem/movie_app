import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';
import 'package:favorite_button/favorite_button.dart';

// ignore: must_be_immutable
class BackdropAndRating extends StatefulWidget {
  final Size size;
  final Movie movie;
  bool fav = false;
  BackdropAndRating(this.size, this.movie, this.fav);
  _BackdropAndRating createState() => _BackdropAndRating();
}

class _BackdropAndRating extends State<BackdropAndRating> {
  String username;

  @override
  Widget build(BuildContext context) {
    if (widget.fav == null)
      return CircularProgressIndicator();
    else {
      bool favflag = widget.fav;

      return Container(
        // 40% of our total height
        height: widget.size.height * 0.4,
        child: Stack(
          children: <Widget>[
            Container(
              height: widget.size.height * 0.4 - 50,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://image.tmdb.org/t/p/original" +
                      widget.movie.poster_path),
                ),
              ),
            ),
            // Rating Box
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                // it will cover 90% of our total width
                width: widget.size.width * 0.9,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 50,
                      color: Color(0xFF12153D).withOpacity(0.2),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset("assets/icons/star_fill.svg"),
                          SizedBox(height: kDefaultPadding / 4),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "${widget.movie.vote_average}/",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(text: "10\n"),
                                TextSpan(
                                  text: "150,212",
                                  style: TextStyle(color: kTextLightColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /*IconButton(
                            icon: Icon(Icons.favorite),
                            color: favflag ? Colors.red : Colors.grey,
                            iconSize: 40,
                            onPressed: () {
                              if (favflag)
                                deleteFav(widget.movie.original_title);
                              else
                                addFav(widget.movie.original_title);
                            },
                          ),*/
                          FavoriteButton(
                            isFavorite: favflag,
                            valueChanged: (_isFavorite) {
                              if (_isFavorite) {
                                addFav(widget.movie.original_title);
                              } else {
                                deleteFav(widget.movie.original_title);
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            // Back Button
            SafeArea(child: BackButton()),
          ],
        ),
      );
    }
  }

  void initState() {
    super.initState();
    getUserName();
  }

  getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    username = sharedPreferences.getString("user");
  }

  addFav(String title) async {
    final data = jsonEncode({'moviename': title, 'username': username});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final url = Uri.parse('http://192.168.1.14:5000/addtofavorite');
    var response = await http.post(url, headers: headers, body: data);
  }

  deleteFav(String title) async {
    final data = jsonEncode({'moviename': title, 'username': username});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final url = Uri.parse('http://192.168.1.14:5000/deletefromfavorite');
    var response = await http.post(url, headers: headers, body: data);
  }
}
