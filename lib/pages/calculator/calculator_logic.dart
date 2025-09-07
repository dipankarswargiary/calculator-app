import 'package:math_expressions/math_expressions.dart';

class CalculatorLogic {
  String displayNum = "0";
  String displayResult = "";
  bool decimalPointUsed = false;

  bool isOperator(String text) {
    if (text == 'AC' || text == 'C' || text == '%'
      || text == '÷' || text == 'X' || text == '-'
      || text == '+' || text == '=') {
        
      return true;
    }
    return false;
  }

  // Handles all the operator button press
  void handleOperation(String op) {
    switch (op) {
      case "AC":
        allClearOp();
        break;
      case "C":
        deleteOp();
        break;
      case "=":
        equalOp();
        break;
      case "%":
        percentageOp();
        break;
      default:
        operatorPressed(op);
    }
  }

  // Handles all the numerical button press
  void buttonPressed(String num) {
    if (num == '') return;
    
    if (num == "." && (decimalPointUsed || isOperator(displayNum[(displayNum.length - 1)]))) {
      return;
    } else if (displayNum == "0" && num != ".") {
      displayNum = num;
    } else {
      displayNum += num;
    }

    if (num == ".") {
      decimalPointUsed = true;
    }

    // calculate the result
    if (num != ".") {
      showResult();
    }
  }

  // Displaying operator symbol on the screen
  void operatorPressed(String op) {
    String last = displayNum[(displayNum.length - 1)];

    if (last == '.' || isOperator(last)) {
      displayNum = displayNum.substring(0, displayNum.length - 1);
    }

    displayNum += op;
    decimalPointUsed = false;
  }


  // ***Operations Logics***

  void allClearOp() {
    displayNum = "0";
    displayResult = "";
    decimalPointUsed = false;
  }

  void deleteOp() {
    int numLen = displayNum.length;

    if (displayNum[(numLen - 1)] == ".") {
      decimalPointUsed = false;
    }

    if (numLen > 1) {
      displayNum = displayNum.substring(0, numLen - 1);
    } else {
      displayNum = "0";
    }
    
    showResult();
  }

  // FIX ME: Bottle neck of the decimal point precision problem
  void percentageOp() {
    if (displayNum.contains('+') || displayNum.contains('-')
      || displayNum.contains('X') || displayNum.contains('÷')) {
        return;
    }

    if (displayNum[(displayNum.length - 1)] == ".") {
      displayNum = displayNum.substring(0, displayNum.length - 1);
    }

    double num = double.parse(displayNum);
    num /= 100;
    displayNum = num.toString();
    
    showResult();
  }

  void equalOp() {
    final String last = displayNum[(displayNum.length - 1)];

    if (isOperator(last) || last == ".") {
      displayNum = displayNum.substring(0, displayNum.length - 1);
    }

    final result = calculate();
    List<String> segments = result.split('.');

    displayResult = "";

    if (double.parse(result) == 0) {
      displayNum = "0";
    }
    else if (segments[1] == "0") {
      displayNum = segments[0];
    }
    else {
      displayNum = result;
    }
  }

  // Handles the small result lebel present in on top
  void showResult() {
    final String result = calculate();
    List<String> segments = result.split('.');

    if (double.parse(result) == 0 && displayNum == "0") {
      displayResult = "";
    }
    else if (segments[1] == "0") {
      displayResult = "= ${segments[0]}";
    }
    else {
      displayResult = "= $result";
    }
  }

  // The real calculator
  String calculate() {
    try {
      String processedExp = displayNum.replaceAll('X', '*').replaceAll('÷', '/');

      final parser = GrammarParser();
      final exp = parser.parse(processedExp);

      final evaluator = RealEvaluator(ContextModel());
      final result = evaluator.evaluate(exp);

      return result.toString();
    } catch (e) {
      return "Error: Invalid expression.";
    }
  }
}