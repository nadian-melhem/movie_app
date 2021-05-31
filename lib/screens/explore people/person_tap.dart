import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/httpFiles/explorePeople.dart';
import 'package:movie_app/models/person.dart';
import 'package:movie_app/screens/explore%20people/person_card.dart';
import 'package:movie_app/screens/explore%20people/person_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

String title, username;

// ignore: must_be_immutable
class PersonTap extends StatefulWidget {
  bool flag;
  PersonTap(this.flag);
  @override
  PersonTapState createState() => PersonTapState();
}

class PersonTapState extends State<PersonTap> {
  ExplorePeopleRequest request = new ExplorePeopleRequest();
  void initState() {
    super.initState();
    getuserName();
  }

  void itemClick(Person person) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonCard(
            username: username, name: person.name, flag: widget.flag),
      ),
    );
  }

  getuserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    username = sharedPreferences.getString('user');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              flexibleSpace: Image(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
              title: Center(
                  child: Text(
                widget.flag ? 'Meet new People' : 'Followers',
                style: TextStyle(color: kTextColor),
              )),
              backgroundColor: Colors.transparent,
            ),
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                )),
                child: Column(
                  children: <Widget>[
                    FutureBuilder<List<Person>>(
                        future: request.fetchNames(username, widget.flag),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            print("inside explorepersontap");
                            return Expanded(
                                child: PeopleList(
                                    names: snapshot.data,
                                    itemClick: this.itemClick,
                                    flag: widget.flag));
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          return CircularProgressIndicator();
                        }),
                  ],
                ))));
  }
}
