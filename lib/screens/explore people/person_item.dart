import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart' as models;
import '../../constants.dart';

class PersonItem extends StatelessWidget {
  final String name;
  PersonItem({this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
              children: <Widget>[Image.asset("assets/images/background.jpg")]),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        fontWeight: FontWeight.w600, color: kTextColor),
                  ),
                ]),
          )
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 8, left: 10, right: 10),
    );
  }
}
