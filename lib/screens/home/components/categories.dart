import 'package:flutter/material.dart';
import 'package:movie_app/httpFiles/top_movies.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/explore/body.dart';
import 'package:movie_app/screens/recommendation/recomm_tap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import 'body.dart';

String user = " ", email = " ";
List<Object> taps = [MainPage(user, email), RecTap(), ExploreTap(user)];

// We need stateful widget because we need to change some sate on our category
class Categorylist extends StatefulWidget {
  @override
  _CategorylistState createState() => _CategorylistState();
}

class _CategorylistState extends State<Categorylist> {
  Future<List<Movie>> futureMovie;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    user = sharedPreferences.getString("user");
    email = sharedPreferences.getString("email");
  }

  int selectedCategory = 0;
  final TopMoviesRequest request = new TopMoviesRequest();
  List<String> categories = ["Top Movies", "Recommended", "Explore"];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index, context),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => taps[selectedCategory]),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: Theme.of(context).textTheme.headline5.copyWith(
                    fontWeight: FontWeight.w600,
                    color: index == selectedCategory
                        ? kSecondaryColor
                        : kTextColor,
                  ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              height: 6,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selectedCategory
                    ? kSecondaryColor
                    : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
