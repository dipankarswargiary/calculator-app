import 'package:calculator/pages/calculator/widgets/calculator_button.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  // button symbols
  final List buttonSymbols = [
    'AC', 'C', '%', '÷',
    '7', '8', '9', 'X',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '',  '0', '.', '=',
  ];

  String _displayNum = "0";
  bool _decimalPointUsed = false;

  bool isOperator(String text) {
    if (text == 'AC' || text == 'C' || text == '%'
      || text == '÷' || text == 'X' || text == '-'
      || text == '+' || text == '=') {
        
      return true;
    }
    return false;
  }

  void _buttonPressed(String num) {
    if (num == '') return;
    
    setState(() {
      if (num == "." && _decimalPointUsed) {
        return;
      } else if (_displayNum == "0" && num != ".") {
        _displayNum = num;
      } else {
        _displayNum += num;
      }

      if (num == ".") {
        _decimalPointUsed = true;
      }
    });
  }

  void _handleOperation(String op) {
    switch (op) {
      case "AC":
        _allClearOp();
        break;
      case "C":
        _deleteOp();
        break;
      case "=":
        _calculate(_displayNum);
        break;
      case "%":
        // TODO: to be implemented % operator
        break;
      default:
        // all other ops
    }
  }

  // Operations

  void _allClearOp() {
    setState(() {
      _displayNum = "0";
      _decimalPointUsed = false;
    });
  }

  void _deleteOp() {
    int numLen = _displayNum.length;

    setState(() {
      if (_displayNum[(numLen - 1)] == ".") {
        _decimalPointUsed = false;
      }

      if (numLen > 1) {
        _displayNum = _displayNum.substring(0, numLen - 1);
      } else {
        _displayNum = "0";
      }
    });
  }

  void _calculate(String expStr) {
    String exp = expStr
      .replaceAll('X', '*')
      .replaceAll('÷', '/');
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: const Color.fromARGB(255, 208, 201, 201),
                              width: 2,
                            ),
                          ),
                        ),

                        child: Text(
                          _displayNum,

                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ),
                    )
                  ],
                )
              ],
            )
          ),

          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: buttonSymbols.length,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.2,
              ),

              padding: EdgeInsets.all(30),

              controller: ScrollController(
                keepScrollOffset: false,
              ),

              itemBuilder:(context, index) => CalculatorButton(
                text: buttonSymbols[index],
                onPressed: () {
                  if (buttonSymbols[index] == '') return;

                  return isOperator(buttonSymbols[index])
                  ? _handleOperation(buttonSymbols[index])
                  : _buttonPressed(buttonSymbols[index]);
                },
                isOperator: isOperator(buttonSymbols[index]),
                isHighlighted: (buttonSymbols[index] == '=') ? true : false,
              ),
            ),
          )
        ],
      ),
    );
  }
}