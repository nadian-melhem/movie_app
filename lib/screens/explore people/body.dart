import 'package:flutter/material.dart';
import 'package:movie_app/screens/explore%20people/personFavourit.dart';

import '../../constants.dart';

class Body extends StatelessWidget {
  String name;
  Body({this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Expanded(
          flex: 4,
          child: SizedBox(
            child: Stack(
              children: [
                Positioned(
                    top: 200,
                    right: 40,
                    child: FlatButton(
                      color: Colors.black,
                      onPressed: () {},
                      child: Text(
                        "Follow",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                            ),
                      ),
                    ))
              ],
            ),
          )),
      Expanded(
          flex: 4,
          child: SizedBox(
            child: Stack(
              children: [
                Positioned(
                    top: 200, right: 40, child: FavouritFuture(name: name)),
              ],
            ),
          ))
    ]));
  }
}
