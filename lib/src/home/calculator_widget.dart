import 'package:simcalc/shared/widgets/imports.dart';
import 'package:flutter/material.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  final List<String> buttons = [
    "AC",
    "+/-",
    "√",
    "DEL",
    "7",
    "8",
    "9",
    "/",
    "4",
    "5",
    "6",
    "x",
    "1",
    "2",
    "3",
    "-",
    "0",
    ".",
    "=",
    "+",
  ];

  String input = '';
  String _input = '';
  String result = '';
  String _result = '';
  double num1 = 0.0;
  double num2 = 0.0;
  String operator = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFCDDFE1),
                border: Border.all(
                  width: 10.0,
                  color: Color(0xFF070707),
                ),
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 0),
                    child: result.isEmpty
                        ? Text(
                            input.length > 10 ? input.substring(0, 10) : input,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 65.0,
                              fontFamily: 'Calculator',
                            ),
                          )
                        : Text(
                            result.length > 11
                                ? result.substring(0, 11)
                                : result,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 65.0,
                              fontFamily: 'Calculator',
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              color: Color(0xFF40413F),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              child: StaggeredGridView.countBuilder(
                staggeredTileBuilder: (int index) => StaggeredTile.count(1, 1),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 4,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 7 || index == 11 || index == 15 || index == 19) {
                    return Button(
                      buttonPressed: () {
                        checkOperator(index);
                      },
                      buttonText: buttons[index],
                      buttonColor: Color(0xFF252525),
                    );
                  }

                  if (index == 0) {
                    return Button(
                      buttonPressed: () {
                        setState(() {
                          input = '';
                          _input = '';
                          result = '';
                          _result = '';
                        });
                      },
                      buttonText: buttons[index],
                      buttonColor: Color(0xFFE9A92F),
                    );
                  } else if (index == 1) {
                    return Button(
                      buttonText: buttons[index],
                      buttonColor: Color(0xFF252525),
                    );
                  } else if (index == 2) {
                    return Button(
                      buttonPressed: () {
                        setState(() {
                          result += sqrt((num.parse(input))).toString();
                        });
                      },
                      buttonText: buttons[index],
                      buttonColor: Color(0xFF252525),
                    );
                  } else if (index == 3) {
                    return Button(
                      buttonPressed: () {
                        setState(() {
                          input = input.substring(0, input.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      buttonColor: Color(0xFF252525),
                    );
                  } else if (index == 18) {
                    return Button(
                      buttonPressed: () {
                        checkResult();
                      },
                      buttonText: buttons[index],
                      buttonColor: Color(0xFF252525),
                    );
                  } else if (index == 17) {
                    return Button(
                      buttonPressed: () {
                        setState(() {
                          if (input.contains(".")) {
                            input.replaceAll('.', '');
                          } else {
                            input = input + buttons[index];
                          }
                        });
                      },
                      buttonText: buttons[index],
                      buttonColor: Color(0xFF252525),
                    );
                  } else {
                    return Button(
                      buttonPressed: () {
                        setState(() {
                          input += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      buttonColor: Color(0xFF252525),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void checkResult() {
    if (result.isEmpty) {
      num2 = double.parse(input);
      if (operator == '/') {
        _result = (num1 / num2).toString();
      }
      if (operator == 'x') {
        _result = (num1 * num2).toString();
      }
      if (operator == '-') {
        _result = (num1 - num2).toString();
      }
      if (operator == '+') {
        _result = (num1 + num2).toString();
      }
      setState(() {
        result = double.parse(_result).toString();
      });
    } else {
      num2 = double.parse(input);
      if (operator == '/') {
        result = (num2 / double.parse(_input)).toString();
      }
      if (operator == 'x') {
        result = (num2 * double.parse(_input)).toString();
      }
      if (operator == '-') {
        result = (num2 - double.parse(_input)).toString();
      }
      if (operator == '+') {
        result = (num2 + double.parse(_input)).toString();
      }

      setState(() {
        input = '';
        result = double.parse(result).toString();
      });
    }
  }

  void checkOperator(int index) {
    if (result.isEmpty) {
      num1 = double.parse(input);
      operator = buttons[index];
      _result = '';
      setState(() {
        input = '';
      });
    } else {
      num1 = double.parse(result);
      operator = buttons[index];
      result = '';
      setState(() {
        input = result.toString();
      });
    }
  }
}
