import 'package:flutter/material.dart';

import 'calculator_body.dart';

class CalViewBody extends StatefulWidget {
  const CalViewBody({super.key});

  static const numbers = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
  ];

  @override
  State<CalViewBody> createState() => _CalViewBodyState();
}

class _CalViewBodyState extends State<CalViewBody> {
  String? result;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CalculatorBody(
              numbers: CalViewBody.numbers,
            ),
          ],
        ),
      ),
    );
  }
}
