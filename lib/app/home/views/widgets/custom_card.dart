import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final String text;
  final Function() viewDetail;

  const CustomCard(this.image, this.text, this.viewDetail);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: viewDetail,
      child: Container(
        width: widthM,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 3),
            borderRadius: BorderRadius.circular(borderRadius5),
            image: DecorationImage(
                image: FileImage(File(image)), fit: BoxFit.cover)),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            decoration: BoxDecoration(
              color: TchombeColor.K_button[300],
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(borderRadius5),
                  bottomLeft: Radius.circular(borderRadius5)),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: padding3,top: padding3,bottom: padding3),
              child: Text(
                text,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
