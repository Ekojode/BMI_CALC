import 'package:flutter/material.dart';

import '../constraints/constants.dart';

class ParameterSelector extends StatelessWidget {
  final double height;
  final String parameter;
  final double parameternum;
  final String suffix;
  final VoidCallback increment;
  final VoidCallback reduction;
  const ParameterSelector(
      {Key? key,
      required this.height,
      required this.parameter,
      required this.parameternum,
      required this.suffix,
      required this.increment,
      required this.reduction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: height,
      // width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            parameter,
            style: cardTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                parameternum.toStringAsFixed(0),
                style: cardNumStyle,
              ),
              Text(
                suffix,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: whiteColor),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: accentColor,
                child: IconButton(
                  onPressed: reduction,
                  icon: const Icon(Icons.remove),
                  iconSize: 20,
                  color: whiteColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: accentColor,
                child: IconButton(
                  onPressed: increment,
                  icon: const Icon(Icons.add),
                  iconSize: 20,
                  color: whiteColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
