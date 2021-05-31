import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class Prediction extends StatefulWidget {
  _Prediction createState() => _Prediction();
}

class _Prediction extends State<Prediction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/predict.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Predict(),
        ));
  }
}
