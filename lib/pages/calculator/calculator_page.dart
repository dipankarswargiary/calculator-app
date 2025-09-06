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
  String _displayResult = "";
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
      if (num == "." && (_decimalPointUsed || isOperator(_displayNum[(_displayNum.length - 1)]))) {
        return;
      } else if (_displayNum == "0" && num != ".") {
        _displayNum = num;
      } else {
        _displayNum += num;
      }

      if (num == ".") {
        _decimalPointUsed = true;
      }

      // calculate the result
      if (num != ".") {
        _showResult();
      }
    });
  }

  void _operatorPressed(String op) {
    String last = _displayNum[(_displayNum.length - 1)];
    if (isOperator(last)) return;

    setState(() {
      if (last == '.') {
        _displayNum = _displayNum.substring(0, _displayNum.length - 1);
      }

      _displayNum += op;
      _decimalPointUsed = false;
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
        _equalOp();
        break;
      case "%":
        _percentageOp();
        break;
      default:
        _operatorPressed(op);
    }
  }

  // Operations

  void _allClearOp() {
    setState(() {
      _displayNum = "0";
      _displayResult = "";
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
      
      _showResult();
    });
  }

  void _percentageOp() {
    setState(() {
      double num = double.parse(_displayNum);
      num /= 100;
      _displayNum = num.toString();
    });
    
    _showResult();
  }

  void _equalOp() {
    final String last = _displayNum[(_displayNum.length - 1)];
    if (isOperator(last) || last == ".") {
      _displayNum = _displayNum.substring(0, _displayNum.length - 1);
    }

    final result = _calculate();
    List<String> segments = result.split('.');
    setState(() {
      _displayResult = "";
      if (double.parse(result) == 0 && _displayNum == "0") {
        _displayNum = "0";
      } else if (segments[1] == "0") {
        _displayNum = segments[0];
      } else {
        _displayNum = result;
      }
    });
  }

  void _showResult() {
    final String result = _calculate();
    List<String> segments = result.split('.');

    setState(() {
      if (double.parse(result) == 0 && _displayNum == "0") {
        _displayResult = "";
      } else if (segments[1] == "0") {
        _displayResult = "= ${segments[0]}";
      } else {
        _displayResult = "= $result";
      }
    });
  }

  // The calculator
  String _calculate() {
    try {
      String processedExp = _displayNum.replaceAll('X', '*').replaceAll('÷', '/');

      final parser = GrammarParser();
      final exp = parser.parse(processedExp);

      final evaluator = RealEvaluator(ContextModel());
      final result = evaluator.evaluate(exp);

      return result.toString();
    } catch (e) {
      return "Error: Invalid expression.";
    }
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

                // result
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),

                        child: Text(
                          _displayResult,

                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600],
                          ),
                        )
                      ),
                    )
                  ],
                ),

                // Operations
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