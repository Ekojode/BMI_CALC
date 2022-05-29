import 'package:bmi_calculator/constraints/constants.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String bmi;
  final String remark;

  const ResultScreen({Key? key, required this.bmi, required this.remark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(bmi),
          Text(
            remark,
            style: cardTextStyle,
          )
        ],
      ),
    );
  }
}
