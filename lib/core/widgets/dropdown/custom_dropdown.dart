import 'package:flutter/material.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown(
    this.value,
    this.text,
    this.itemsList,
    this.onSelectDropDown,
  );

  final String text;
  final String? value;
  final List itemsList;
  final Function onSelectDropDown;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: Icon(Icons.keyboard_arrow_down),
      isExpanded: true,iconSize: 30 ,
      underline: Divider(height: height10, thickness: 2),
      value: value,
      hint: Text(text),
      items: itemsList.map(
        (type) {
          return DropdownMenuItem<String>(value: type, child: Text(type));
        },
      ).toList(),
      onChanged: (value) {
        onSelectDropDown(value);
      },
    );
  }
}
