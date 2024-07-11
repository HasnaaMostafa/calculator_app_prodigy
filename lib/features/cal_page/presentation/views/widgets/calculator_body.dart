import 'package:calculator_app/features/cal_page/presentation/views/widgets/result_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_delete_container.dart';
import 'custom_miuns_container.dart';
import 'custom_mul_div_container.dart';
import 'custom_number_container.dart';
import 'custom_plus_assign_container.dart';
import 'custom_zero_container.dart';

class CalculatorBody extends StatefulWidget {
  const CalculatorBody({
    super.key,
    required this.numbers,
  });

  final List<String> numbers;

  @override
  State<CalculatorBody> createState() => _CalculatorBodyState();
}

class _CalculatorBodyState extends State<CalculatorBody> {
  List<String> numbers = [];
  String input1 = '';
  String operator = '';
  String input2 = '';
  double result = 0.0;
  void handleNumberTap(String number) {
    if (operator.isEmpty) {
      input1 += number;
    } else {
      input2 += number;
    }
    updateResult();
  }

  void handleOperatorTap(String op) {
    setState(() {
      if (input1.isNotEmpty && input2.isNotEmpty) {
        calculateResult();
      }
      operator = op;
    });
  }

  void handleEqualTap() {
    setState(() {
      input1 = result.toString();
      input2 = '';
      operator = '';
      result = 0;
    });
  }

  void handleMoreThanTwoInputs() {
    if (result != 0) {
      setState(() {
        input1 = result.toString();
        input2 = '';
        result = 0;
      });
    }
  }

  double calculateResult() {
    double num1 = double.parse(input1);
    double num2 = double.parse(input2);

    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num1 / num2;
        break;
    }

    return result;
  }

  void updateResult() {
    setState(() {
      if (input1.isNotEmpty && input2.isNotEmpty) {
        result = calculateResult();
      }
    });
  }

  void clear() {
    setState(() {
      input1 = '';
      operator = '';
      input2 = '';
      result = 0.0;
    });
  }

  void delete() {
    if (input1 == "" && operator == "" && input2 == "") {
      setState(() {
        input1 = '';
        operator = '';
        input2 = '';
        result = 0;
      });
    } else if (input1.isNotEmpty && operator == "" && input2 == "") {
      setState(() {
        input1 = input1.substring(0, input1.length - 1);
      });
    } else if (input1 != "" && operator != "" && input2.isNotEmpty) {
      setState(() {
        input2 = input2.substring(0, input2.length - 1);
        result = 0;
      });
    } else if (input1 != "" && operator != "" && input2 == "") {
      setState(() {
        operator = '';
      });
    }
    updateResult();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResultContainer(
          firstInput: input1,
          operator: operator,
          secondInput: input2,
          result: result,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 2 / 3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: CustomNumberContainer(
                        text: "AC",
                        onTap: clear,
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: CustomDeleteContainer(
                        text: "x",
                        onTap: () {
                          delete();
                        },
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: CustomMulDivContainer(
                        text: '/',
                        onTap: () {
                          handleOperatorTap('/');
                          handleMoreThanTwoInputs();
                        },
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: CustomMulDivContainer(
                        text: '*',
                        onTap: () {
                          handleOperatorTap('*');
                          handleMoreThanTwoInputs();
                        },
                      )),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: 430,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 11,
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Center(
                                    child: CustomNumberContainer(
                                      onTap: () {
                                        handleNumberTap(widget.numbers[index]);
                                      },
                                      text: widget.numbers[index],
                                    ),
                                  );
                                },
                                itemCount: widget.numbers.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 5),
                              ),
                            ),
                            Expanded(
                                flex: 6,
                                child: Row(
                                  children: [
                                    CustomZeroContainer(
                                      onTap: () {
                                        handleNumberTap("0");
                                      },
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            right: 7, left: 7),
                                        child: CustomNumberContainer(
                                          text: ".",
                                          onTap: () {
                                            handleNumberTap(".");
                                          },
                                        ))
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                handleOperatorTap('-');
                                handleMoreThanTwoInputs();
                              },
                              child: const CustomMinContainer(
                                text: '-',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                handleOperatorTap('+');
                                handleMoreThanTwoInputs();
                              },
                              child: const CustomPlusAssignContainer(
                                text: '+',
                                color: Color(0xff025cb2),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                handleEqualTap();
                              },
                              child: const CustomPlusAssignContainer(
                                text: '=',
                                color: Color(0xff1a90ff),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
