import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class CardPickImage extends StatelessWidget {
  const CardPickImage({Key? key, required this.image}) : super(key: key);
  final String image;


  @override
  Widget build(BuildContext context) {
    Size  size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      decoration: BoxDecoration(
          color: TchombeColor.K_button[300],
          borderRadius: BorderRadius.circular(borderRadius20),

          image: DecorationImage(
              image: FileImage(File(image)), fit: BoxFit.cover)),
    );
  }
}
