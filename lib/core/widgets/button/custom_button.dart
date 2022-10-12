import 'package:flutter/material.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.child,
    required this.buttonFunction,
    this.buttonColor = TchombeColor.buttonSecondary,
  });
  final Widget child;
  final Function() buttonFunction;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed:buttonFunction,
      child: child,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.all(borderRadius10),
        alignment: Alignment.center,
        backgroundColor: buttonColor,
      ),
    );
  }
}
