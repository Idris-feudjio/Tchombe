import 'package:flutter/material.dart';

class CustomRoundTextField extends StatelessWidget {
  const CustomRoundTextField({this.hintText,required this.icon,  Key? key}) : super(key: key);

  final String? hintText;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(1, 1),
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 7,
            )
          ]),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
            prefixIcon: icon,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}

/*
Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(10),
boxShadow: [
BoxShadow(
blurRadius: 10,
offset: const Offset(1, 1),
color: Colors.grey.withOpacity(0.5),
spreadRadius: 7,
)
]),
child: TextField(
decoration: InputDecoration(
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: const BorderSide(color: Colors.white, width: 1.0),
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: const BorderSide(color: Colors.white, width: 1.0),
),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
)),
),
),
*/
