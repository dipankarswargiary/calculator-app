import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isOperator;
  final bool isHighlighted;

  const CalculatorButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isOperator = false,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: isHighlighted? Colors.orange : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      ),

      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: 
            isHighlighted
            ? Colors.white
            : (isOperator? Colors.orange : null),
        )
      ),
    );
  }
}
