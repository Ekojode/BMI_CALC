import 'package:bmi_calculator/constraints/bmi_calculator.dart';
import 'package:bmi_calculator/constraints/constants.dart';
import 'package:bmi_calculator/screens/results_screen.dart';
import 'package:bmi_calculator/widgets/parameter_selector.dart.dart';

import 'package:flutter/material.dart';

import '../widgets/gender_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/Homescreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender genderSelected = Gender.male;
  double height = 180;
  double weight = 60;
  double age = 25;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        AppBar().preferredSize.height;

    return Scaffold(
      drawer: const Drawer(
        backgroundColor: accentColor,
      ),
      /*  appBar: AppBar(
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
        ),
        centerTitle: true,
        backgroundColor: mainolor,
      ),*/
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
              children: [
                Expanded(
                  flex: genderSelected == Gender.male ? 4 : 3,
                  child: GenderPicker(
                    gender: "MALE",
                    genderIcon: Icons.male,
                    selected: genderSelected == Gender.male,
                    onTap: () {
                      setState(() {
                        genderSelected = Gender.male;
                      });
                    },
                    height: screenHeight * 0.2,
                  ),
                ),
                Expanded(
                  flex: genderSelected == Gender.female ? 4 : 3,
                  child: GenderPicker(
                    gender: "FEMALE",
                    genderIcon: Icons.female,
                    selected: genderSelected == Gender.female,
                    onTap: () {
                      setState(() {
                        genderSelected = Gender.female;
                      });
                    },
                    height: screenHeight * 0.2,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: screenHeight * 0.3,
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "HEIGHT",
                  style: cardTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      (height.toStringAsFixed(1)),
                      style: cardNumStyle,
                    ),
                    const Text(
                      "cm",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
                Slider.adaptive(
                    min: 100,
                    max: 240,
                    thumbColor: accentColor,
                    activeColor: whiteColor,
                    inactiveColor: whiteColor,
                    value: height,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    })
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ParameterSelector(
                    height: screenHeight * 0.3,
                    parameter: "WEIGHT",
                    parameternum: weight,
                    suffix: "kg",
                    increment: () {
                      setState(() {
                        weight++;
                      });
                    },
                    reduction: () {
                      setState(() {
                        weight--;
                      });
                    }),
              ),
              Expanded(
                  child: ParameterSelector(
                      height: screenHeight * 0.3,
                      parameter: "AGE",
                      parameternum: age,
                      suffix: "yo",
                      increment: () {
                        setState(() {
                          age++;
                        });
                      },
                      reduction: () {
                        setState(() {
                          age--;
                        });
                      }))
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: accentColor,
        child: SizedBox(
          height: screenHeight * 0.0875,
          child: ElevatedButton(
            onPressed: () {
              BmiCalc calc = BmiCalc(height: height, weight: weight);
              //    print(calc.calculateBmi());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      bmi: calc.calculateBmi(),
                      remark: calc.getInterpretation(),
                      interpretation: calc.getResult(),
                    ),
                  ));
            },
            style: ElevatedButton.styleFrom(primary: accentColor),
            child: const Text(
              "CALCULATE",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
