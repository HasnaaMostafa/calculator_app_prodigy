import 'package:flutter/material.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({
    super.key,
    required this.firstInput,
    required this.operator,
    required this.secondInput,
    required this.result,
  });
  final String firstInput;
  final String operator;
  final String secondInput;
  final double result;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      color: Colors.blueAccent.withOpacity(0.3),
      height: MediaQuery.of(context).size.height * 1 / 3,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '$firstInput $operator $secondInput',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            if (result != 0.0)
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '$result',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontSize: 30,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
