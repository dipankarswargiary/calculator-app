import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  String _displayNum = "0";
  bool _decimalPointUsed = false;

  void _buttonPressed(String num) {
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
      case "%":

        break;
      case "/":

        break;
      case "X":

        break;
      case "-":

        break;
      case "+":

        break;
      case "=":

        break;
      case ".":
        // not yet to be done
        break;
      default:
        break;
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
            child: GridView(
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

              children: [

                // AC
                ElevatedButton(
                  onPressed: () {
                    _handleOperation("AC");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "AC",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.orange,
                    )
                  ),
                ),

                // Clear
                ElevatedButton(
                  onPressed: () {
                    _handleOperation("C");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "C",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.orange,
                    )
                  ),
                ),

                // percentage
                ElevatedButton(
                  onPressed: () {
                    _handleOperation("%");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "%",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange,
                    )
                  ),
                ),

                // devide
                ElevatedButton(
                  onPressed: () {
                    _handleOperation("/");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "/",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange,
                    )
                  ),
                ),

                // 7
                ElevatedButton(
                  onPressed: () {
                    _buttonPressed("7");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "7",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                ),

                // 8
                ElevatedButton(
                  onPressed: () {
                    _buttonPressed("8");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "8",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                ),

                // 9
                ElevatedButton(
                  onPressed: () {
                    _buttonPressed("9");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "9",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                ),

                // X
                ElevatedButton(
                  onPressed: () {
                    _handleOperation("X");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "X",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.orange,
                    )
                  ),
                ),

                // 4
                ElevatedButton(
                  onPressed: () {
                    _buttonPressed("4");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "4",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                ),

                // 5
                ElevatedButton(
                  onPressed: () {
                    _buttonPressed("5");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "5",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                ),

                // 6
                ElevatedButton(
                  onPressed: () {
                    _buttonPressed("6");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "6",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                ),

                // -
                ElevatedButton(
                  onPressed: () {
                    _handleOperation("-");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "-",
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w400,
                      color: Colors.orange,
                    )
                  ),
                ),

                // 1
                ElevatedButton(
                  onPressed: () {
                    _buttonPressed("1");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "1",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                ),

                // 2
                ElevatedButton(
                  onPressed: () {
                    _buttonPressed("2");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "2",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                ),

                // 3
                ElevatedButton(
                  onPressed: () {
                    _buttonPressed("3");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "3",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                ),

                // +
                ElevatedButton(
                  onPressed: () {
                    _handleOperation("+");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "+",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.orange,
                    )
                  ),
                ),

                // empty
                ElevatedButton(
                  onPressed: () {
                    _handleOperation("");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),

                  child: Text(""),
                ),

                // 0
                ElevatedButton(
                  onPressed: () {
                    _buttonPressed("0");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    "0",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                ),

                // .
                ElevatedButton(
                  onPressed: () {
                    _buttonPressed(".");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),

                  child: Text(
                    ".",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                ),

                // =
                ElevatedButton(
                  onPressed: () {
                    _handleOperation("=");
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    backgroundColor: Colors.orange,
                  ),

                  child: Text(
                    "=",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}