import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/screens/profile/home.dart';

class NavDrawer extends StatelessWidget {
  final String username, email;
  NavDrawer(this.username, this.email);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              username,
              style: TextStyle(
                color: kTextColor,
                fontSize: 25,
              ),
            ),
            decoration: BoxDecoration(
                // color: darkblue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/background.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop(Profile(username, email))},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Share'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (BuildContext context) => MyApp()),
                  (Route<dynamic> route) => false)
            },
          ),
        ],
      ),
    );
  }
}
