import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class SingleImagePage extends StatelessWidget {
  static final String routeName = '/singleImagePage';
  const SingleImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("${Get.arguments.summary.value.brand ?? ''}",
              style: Theme.of(context).appBarTheme.titleTextStyle)),
      body: InkWell(
        onTap: () => Get.back(),
        child: Container(
          child: PhotoView(
            imageProvider:
                FileImage(File(Get.arguments.summary.value.imageUri!)),
            filterQuality: FilterQuality.high,
            basePosition: Alignment.center,
            backgroundDecoration:
                BoxDecoration(color: Theme.of(context).cardTheme.color),
            enablePanAlways: true,
            enableRotation: true,
          ),
        ),
      ),
    );
  }
}
