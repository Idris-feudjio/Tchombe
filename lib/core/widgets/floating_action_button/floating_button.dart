import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  CustomFloatingActionButton({required this.onPressButton, this.heroTag});
  final Function()? onPressButton;
  final dynamic heroTag;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressButton,
      child: Icon(
        Icons.add,
      ),
    );
  }
}
