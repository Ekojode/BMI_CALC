import 'package:bmi_calculator/constraints/constants.dart';
import 'package:flutter/material.dart';
//import 'dart:convert';

class ResultScreen extends StatelessWidget {
  final String interpretation;
  final double bmi;
  final String remark;

  const ResultScreen(
      {Key? key,
      required this.bmi,
      required this.remark,
      required this.interpretation})
      : super(key: key);

  TextStyle get interpretationStyle {
    var remarkTextStyle = const TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);
    if (bmi >= 25 || bmi <= 18.5) {
      remarkTextStyle = const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red);
    } else {
      remarkTextStyle = const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green);
    }
    return remarkTextStyle;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        AppBar().preferredSize.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI CALCULATOR",
            style: TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
          ),
          centerTitle: true,
          backgroundColor: mainolor,
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "   Your Result!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: whiteColor,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              height: screenHeight * 0.55,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: cardColor,
              ),
              child: Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    interpretation,
                    style: interpretationStyle,
                  ),
                  const SizedBox(height: 8),
                  Text(bmi.toStringAsFixed(2), style: cardNumStyle),
                  const SizedBox(height: 8),
                  Text(
                    "Normal BMI range:",
                    style: TextStyle(color: Colors.blueGrey[50]),
                  ),
                  const Text(
                    "18.5 - 25 kg/m2",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: whiteColor),
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
