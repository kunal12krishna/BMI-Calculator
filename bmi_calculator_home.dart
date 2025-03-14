import 'package:flutter/material.dart';

class BmiCalculatorHome extends StatefulWidget {
  const BmiCalculatorHome({super.key});
  @override
  State<BmiCalculatorHome> createState() => _BmiCalculatorHomeState();
}

class _BmiCalculatorHomeState extends State<BmiCalculatorHome> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  double bmiResult = 0.0;

  void bmiCalc() {
    double height = double.tryParse(textEditingController.text) ?? 0;
    double weight = double.tryParse(textEditingController2.text) ?? 0;
    if (height > 0 && weight > 0) {
      double bmi = weight / ((height / 100) * (height / 100));
      setState(() {
        bmiResult = bmi;
      });
    } else {
      setState(() {
        bmiResult = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "BMI Calculator",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.purpleAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 120,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: textEditingController, // Add the controller here
                  decoration: InputDecoration(
                    hintText: "Enter Height in cm",
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: textEditingController2, // Add the controller here
                  decoration: InputDecoration(
                    hintText: "Enter Weight in kg",
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              IconButton(
                onPressed: bmiCalc,
                icon: Icon(Icons.calculate),
                color: Colors.white,
                iconSize: 40,
              ),
              SizedBox(height: 10),
              Text(
                bmiResult != 0.0 ? "BMI: ${bmiResult.toStringAsFixed(2)}" : "",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
