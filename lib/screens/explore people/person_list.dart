import 'package:flutter/material.dart';
import 'package:movie_app/screens/explore%20people/person_item.dart';

class PeopleList extends StatelessWidget {
  final List<String> names;
  final Function itemClick;

  PeopleList({this.names, this.itemClick});

  @override
  Widget build(context) {
    return new Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        )),
        child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: this.names.length,
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                  child: PersonItem(name: this.names[index]),
                  onTap: () => this.itemClick(this.names[index]));
            }));
  }
}
