import 'package:bmi_calculator/constraints/constants.dart';
import 'package:flutter/material.dart';

class GenderPicker extends StatelessWidget {
  final String gender;
  final IconData genderIcon;
  final bool selected;
  final double height;
  final VoidCallback onTap;
  const GenderPicker(
      {Key? key,
      required this.gender,
      required this.genderIcon,
      required this.selected,
      required this.onTap,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
        height: height,
        decoration: BoxDecoration(
          color: cardColor,
          border: Border.all(
            color: selected ? Colors.amber.withOpacity(0.4) : mainolor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              genderIcon,
              size: 40,
              color: whiteColor,
            ),
            Text(
              gender,
              style: cardTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
