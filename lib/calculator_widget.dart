import 'shared/widgets/imports.dart';
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
    "%",
    "DEL",
    "7",
    "8",
    "9",
    "/",
    "4",
    "5",
    "6",
    "*",
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
  String result = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF99AE51),
                border: Border.all(
                  width: 10.0,
                  color: Color(0xFF070707),
                ),
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '$input',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 65.0,
                        fontFamily: 'Calculator',
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '$result',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 65.0,
                        fontFamily: 'Calculator',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
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
                  if (index == 0) {
                    return Button(
                      buttonPressed: () {
                        setState(() {
                          input = '';
                          result = '0';
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
                          input += buttons[index];
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
                        setState(() {
                          equalPressed();
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

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalUserInput = input;
    finalUserInput = input.replaceAll(
      'x',
      '*',
    );

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    result = eval.toString();
  }
}
