import 'package:flutter/material.dart';
import 'package:movie_app/components/rounded_input.dart';

import '../constants.dart';

class RoundedPassword extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPassword({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        style: TextStyle(color: kTextColor),
        cursorColor: kTextColor,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: kTextColor),
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: darkblue,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: darkblue,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
