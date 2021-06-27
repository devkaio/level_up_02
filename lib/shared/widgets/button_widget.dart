import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final buttonColor;
  final String? buttonText;
  final buttonPressed;

  const Button({this.buttonColor, this.buttonText, this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        buttonText!,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
        ),
      ),
      onPressed: buttonPressed,
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
      ),
    );
  }
}
