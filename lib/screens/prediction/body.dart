import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/screens/prediction/prediction.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:percent_indicator/percent_indicator.dart';

// ignore: must_be_immutable
class Predict extends StatefulWidget {
  _Predict createState() => _Predict();
}

class _Predict extends State<Predict> {
  double result, percentage;

  Color lineColor = darkblue;
  var budget;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
      children: [
        Expanded(
            flex: 3,
            child: SizedBox(
                child: Stack(children: [
              Positioned(
                  top: 370,
                  right: 120,
                  child: RoundedInput(
                    hintText: "Insert Budget",
                    onChanged: (value) {
                      budget = value;
                    },
                  ))
            ]))),
        Expanded(
            flex: 1,
            child: SizedBox(
                child: Stack(children: [
              Positioned(
                  top: 10,
                  left: 150,
                  child: FlatButton(
                    color: Colors.transparent,
                    onPressed: () {
                      predict(budget);
                    },
                    child: Text(
                      "Predict",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kTextColor,
                          ),
                    ),
                  ))
            ]))),
        Expanded(
            flex: 1,
            child: SizedBox(
                child: Stack(children: [
              Positioned(
                  left: 120,
                  child: Column(
                    children: [
                      new LinearPercentIndicator(
                        width: 180.0,
                        lineHeight: 8.0,
                        percent: 1,
                        progressColor: lineColor,
                      ),
                      Text(((percentage * 100).toStringAsFixed(2)) + "%",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: kTextColor, fontWeight: FontWeight.bold)),
                    ],
                  ))
            ]))),
      ],
    ));
  }

  predict(var budget) async {
    final data = jsonEncode({'budget': budget});

    var jsonResponse = null;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final url = Uri.parse('http://192.168.1.14:5000/predict');
    var response = await http.post(url, headers: headers, body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse['type'] == "success") {
        result = jsonResponse['message'];
        print(result);
        percentage = ((result - double.parse(budget)) / double.parse(budget));
        if (result > 0)
          lineColor = darkblue;
        else
          lineColor = Colors.red;
      }
    }
  }
}
