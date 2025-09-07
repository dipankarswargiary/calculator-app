import 'package:calculator/pages/calculator/calculator_logic.dart';
import 'package:calculator/pages/calculator/widgets/calculator_button.dart';
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

  final CalculatorLogic logic = CalculatorLogic();

  void onButtonPressed(String value) {
    if (logic.isOperator(value)) {
      logic.handleOperation(value);
    }
    else {
      logic.buttonPressed(value);
    }

    setState(() {});
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
                          logic.displayResult,

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
                          logic.displayNum,

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
                  onButtonPressed(buttonSymbols[index]);
                },
                isOperator: logic.isOperator(buttonSymbols[index]),
                isHighlighted: (buttonSymbols[index] == '=') ? true : false,
              ),
            ),
          )
        ],
      ),
    );
  }
}