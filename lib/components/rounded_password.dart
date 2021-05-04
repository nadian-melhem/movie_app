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
        cursorColor: kSecondaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kSecondaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kSecondaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
