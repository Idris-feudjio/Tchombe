import 'package:flutter/material.dart';
import 'package:tchombe/app/clothes/views/widgets/custom_clothes_item.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'dart:io';

import 'package:tchombe/themes/tchombe_sizes.dart';
import 'package:get/get.dart';

class ImageContainer extends StatelessWidget {
  ImageContainer(
      {required this.imageUri,
      this.checkedListIsNotEmpty = false,
      this.text,
      this.price,
        this.containerWith,
      this.listHasItem = false});

  final String imageUri;
  final String? text;
  final double? price;
  final double? containerWith;
  final bool checkedListIsNotEmpty;
  final bool listHasItem;

  @override
  Widget build(BuildContext context) {
    TextStyle style() {
      return TextStyle(
        color: Theme.of(context).textTheme.bodyText1!.color,
        fontWeight: FontWeight.bold,
      );
    }

    return Container(
      width: containerWith,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius10)),
          image: DecorationImage(
            image: FileImage(File(imageUri)),
            fit: BoxFit.cover,
          ),
          border: !checkedListIsNotEmpty
              ? Border.all(
                  color: listHasItem ? TchombeColor.K_red : Colors.white,
                  width: listHasItem ? borderRadius5 : borderRadius5,
                  style: BorderStyle.solid)
              : Border.all(color: Colors.white, width: 5)),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: listHasItem
                ? CustomCheckBox()
                : Get.arguments != null || !checkedListIsNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(padding8),
                        child: CircleAvatar(
                          radius: borderRadius10,
                          backgroundColor: TchombeColor.kGreyLight,
                          child: CircleAvatar(
                            radius: borderRadius8,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      )
                    : Container(),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(borderRadius5),
                      bottomLeft: Radius.circular(borderRadius5)),
                  color: TchombeColor.K_button[300],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: padding10, vertical: padding10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(text ?? "",
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: style()),
                      ),
                      price!=null? Text('$price ' + 'K_DEVICE'.tr,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          style: style()):Text('')
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding8),
      child: CircleAvatar(
          radius: borderRadius10,
          child: Icon(Icons.check, size: icon20, color: Colors.white),
          backgroundColor: TchombeColor.K_red),
    );
  }
}
