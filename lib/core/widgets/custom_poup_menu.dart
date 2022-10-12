import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class CustomPopUpMenu extends StatelessWidget {
  CustomPopUpMenu({required this.customPopUpItems, required this.onSelected});

  final List customPopUpItems;
  final Function  onSelected;

  @override
  Widget build(BuildContext context) {
    Widget customPopItem({Icon? icon, String? text}) {
      return Row(
        children: [
          icon!,
          SizedBox(width: width5),
          Text(text!),
        ],
      );
    }

    return PopupMenuButton(
      itemBuilder: (_) => customPopUpItems
          .map((item) => PopupMenuItem(
              value: item.text,
              child: customPopItem(
                  icon: Icon(
                    item.iconData,
                    color: item.text != 'K_DELETE'.tr
                        ? Colors.green
                        : Colors.redAccent,
                  ),
                  text: item.text)))
          .toList(),
      onSelected: onSelected() ,
    );
  }
}
