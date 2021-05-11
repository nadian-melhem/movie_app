import 'package:flutter/material.dart';

import '../../constants.dart';

class RoundedInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final dynamic onChanged;
  final Future<dynamic> onpressed;

  const RoundedInput(
      {Key key,
      this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kTextColor,
        decoration: InputDecoration(
          hintStyle: TextStyle(
              fontSize: 23, color: Colors.black, fontWeight: FontWeight.bold),
          suffixIcon: IconButton(
            icon: Icon(Icons.edit),
            color: darkblue,
            // onPressed: onpressed,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        style: TextStyle(color: kTextColor),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 0.05),
      width: size.width * 0.8,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        //  border: Border.all(color: buttoncolor)
      ),
      child: child,
    );
  }
}
