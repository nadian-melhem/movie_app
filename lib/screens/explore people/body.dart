import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movie_app/screens/explore%20people/personFavourit.dart';

import '../../constants.dart';

String followed = "Follow";

// ignore: must_be_immutable
class Body extends StatelessWidget {
  String name, username, result;
  bool flag;
  int count = 0;
  Body(this.username, this.name, this.flag);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Expanded(
          flex: 2,
          child: SizedBox(
            child: Stack(
              children: [
                Positioned(
                    top: 270,
                    left: (60 - name.length.toDouble()),
                    child: Row(
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                        ),
                        SizedBox(
                          width: 100 - name.length.toDouble(),
                        ),
                        FlatButton(
                          //color: Colors.black,
                          onPressed: () {
                            if (count % 2 == 0) {
                              addFollower(name);
                              if (result == "success") followed = "Followed";
                            } else {
                              deleteFollower(name);
                              followed = "Follow";
                            }
                            count++;
                            print(count);
                            print(followed);
                          },
                          child: Text(
                            flag ? "Follow" : "Followed",
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          )),
      Expanded(
          flex: 2,
          child: SizedBox(
            child: Stack(
              children: [
                Positioned(child: FavouritFuture(name: name)),
              ],
            ),
          ))
    ]));
  }

  addFollower(String name) async {
    final data = jsonEncode({'username': username, 'followername': name});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final url = Uri.parse('http://192.168.1.14:5000/addtofollowers');
    var jsonResponse = null;
    var response = await http.post(url, headers: headers, body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse['type'] == "success") {
        result = "success";
      } else {
        result = "failed";
      }
    } else {
      result = "failed";
    }
  }

  deleteFollower(String name) async {
    final data = jsonEncode({'username': username, 'followername': name});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final url = Uri.parse('http://192.168.1.14:5000/deletefromfollowers');
    var jsonResponse = null;
    var response = await http.post(url, headers: headers, body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse['type'] == "success") {
        print("unFollowed");
      } else
        print("an error Ocuured");
    } else
      print("an error Ocuured");
  }
}
