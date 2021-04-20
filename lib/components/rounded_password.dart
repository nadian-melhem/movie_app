import 'package:flutter/material.dart';
import 'package:movie_app/components/rounded_input.dart';

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
        cursorColor: Colors.red,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Colors.red,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.red,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
